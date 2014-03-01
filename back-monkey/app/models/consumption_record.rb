class ConsumptionRecord < ActiveRecord::Base
  belongs_to :user

  def dose_description
    desc = "#{self.amount} #{self.unit_of_measure}"
    desc += "s" unless self.amount == 1
    desc
  end
end