class CreateConsumptionRecords < ActiveRecord::Migration
  def change
    create_table :consumption_records do |col|
      col.belongs_to :user
      col.string :substance
      col.integer :amount
      col.string :unit_of_measure
      col.timestamps
    end 
  end
end
