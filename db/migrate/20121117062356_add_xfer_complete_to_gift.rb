class AddXferCompleteToGift < ActiveRecord::Migration
  def change
    add_column :gifts, :xfer_complete, :boolean, :default => false
  end
end
