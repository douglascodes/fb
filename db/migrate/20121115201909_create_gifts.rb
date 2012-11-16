class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title
      t.integer :amount
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
