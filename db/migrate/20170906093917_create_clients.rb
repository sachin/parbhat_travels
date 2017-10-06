class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :gstno
      t.string :state
      t.string :code
      t.timestamps
    end
  end
end
