class ConsumptionRecord < ActiveRecord::Base
  attr_accessible :substance, :amount, :unit_of_measure
  belongs_to :user
  before_save :update_user_total

  def dose_description
    desc = "#{self.amount} #{self.unit_of_measure}"
    desc += "s" unless self.amount == 1
    desc 
  end

  def update_user_total
    if self.user
      self.user.total_alcohol += self.amount if self.substance == "alcohol"
      self.user.total_caffeine += self.amount if self.substance == "caffeine"
      self.user.total_nicotine += self.amount if self.substance == "nicotine"
      self.user.save
    end
  end
end