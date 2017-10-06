class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :gstno
      t.string :state
      t.string :account_no
      t.string :ifsc_code
      t.string :code

      t.timestamps
    end
  end
end
