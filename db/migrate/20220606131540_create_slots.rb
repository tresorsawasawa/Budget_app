class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.belongs_to :category
      t.belongs_to :exchange
      t.timestamps
    end
  end
end
