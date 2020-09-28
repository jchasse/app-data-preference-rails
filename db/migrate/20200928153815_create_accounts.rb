class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :org_name
      t.string :website
      t.string :toll_free_number

      t.timestamps
    end
  end
end
