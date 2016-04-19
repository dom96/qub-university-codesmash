class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :total
      t.string :items
    end
  end
end
