class ConsumptionRecord < ActiveRecord::Base
  attr_accessible :substance, :amount, :unit_of_measure
  belongs_to :user
  before_save :update_user_total

  def dose_description
    desc = "#{self.amount} #{self.unit_of_measure}"
    desc += "s" unless self.single?
    desc
  end

  def single?
    self.amount == 1
  end

  def update_user_total
    self.user.update_totals(self.amount, self.substance) if self.user
  end

end
