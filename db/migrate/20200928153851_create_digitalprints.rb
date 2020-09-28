class CreateDigitalprints < ActiveRecord::Migration[6.0]
  def change
    create_table :digitalprints do |t|

      t.timestamps
    end
  end
end
