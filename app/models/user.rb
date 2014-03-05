class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :gender, :weight
  has_many :consumption_records
  validates :user_name, :email, :gender, :weight, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :gender, inclusion: { in: ["m", "f"]}
  validates :user_name, :email, uniqueness: true
  has_secure_password

  def daily_average_alcohol
    self.total_alcohol / days_account_open
  end

  def daily_average_caffeine
    self.total_caffeine / days_account_open
  end

  def daily_average_nicotine
    self.total_nicotine / days_account_open
  end

  def past_month_consumption
    self.consumption_records.where('created_at > ?', (Time.zone.now - 18141000)).reverse
  end

  def past_week_consumption
    self.consumption_records.where('created_at > ?', (Time.zone.now - 604800)).reverse
  end

  def days_account_open
    days = ((Time.zone.now - self.created_at)/86400).ceil
    days == 0 ? 1 : days
  end

  def daily_comparison_alcohol
    (((self.daily_average_alcohol - 0.6) / 0.6) * 100).floor
  end

  def daily_comparison_caffeine
    (((self.daily_average_caffeine - 300) / 300.0) * 100).floor
  end

  def daily_comparison_nicotine
    (((self.daily_average_nicotine - 15) / 15.0) * 100).floor
  end
end