class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :gender, :weight
  has_many :consumption_records
  validates :user_name, :email, :gender, :weight, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :gender, inclusion: { in: ["m", "f"]}
  has_secure_password

  # def self.current_gender
  #   if current_user
  #     @gender = current_user.gender
  #   else
  #     @gender = "Male"
  #   end
  # end

  # def self.current_weight
  #   if current_user
  #     @weight = current_user.weight
  #   else
  #     @weight = 0
  #   end
  # end


end