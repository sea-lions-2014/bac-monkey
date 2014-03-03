class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :user_name, :email, :password, :gender, :weight
  has_many :consumption_records
  validates :user_name, :email, :gender, :weight, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :gender, inclusion: { in: ["m", "f"]}

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
    self.consumption_records.where('created_at > ?', (Time.zone.now - 18141000))
  end

  def past_week_consumption
    self.consumption_records.where('created_at > ?', (Time.zone.now - 604800))
  end

  def days_account_open
    days = ((Time.zone.now - self.created_at)/86400).ceil
    days == 0 ? 1 : days
  end

  def update_totals amount, substance
    case substance
    when "alcohol"
      self.total_alcohol += amount
    when "caffeine"
      self.total_caffeine += amount
    when "nicotine"
      self.total_nicotine += amount
    end
    self.save
  end
end
