class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :card_type
      t.string :card_number
      t.string :card_date
      t.string :card_cvc
      t.string :status, default: "Processing"
      t.timestamps
    end
  end
end
