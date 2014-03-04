class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :gender, :weight
  has_many :consumption_records
  validates :user_name, :email, :gender, :weight, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :gender, inclusion: { in: ["m", "f"]}
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

  # Daily average consumption for all users, not individual users:
  class << self
    def daily_average_alcohol
      (User.all.map { |user| user.daily_average_alcohol }).reduce(:+) / User.count
    end

    def daily_average_caffeine
      (User.all.map { |user| user.daily_average_caffeine }).reduce(:+) / User.count
    end

    def daily_average_nicotine
      (User.all.map { |user| user.daily_average_nicotine }).reduce(:+) / User.count
    end
  end
end