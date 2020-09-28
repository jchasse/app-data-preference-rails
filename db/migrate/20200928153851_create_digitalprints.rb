class CreateDigitalprints < ActiveRecord::Migration[6.0]
  def change
    create_table :digitalprints do |t|
      t.string :kind
      t.integer :user_id
      t.integer :account_id 

      t.timestamps
    end
  end
end
