class CreateLocations < ActiveRecord::Migration[5.2]
    def change
        create_table :locations do |t|
            t.string :country_code, null: false, unique: true
            t.string :country, null: false
            t.string :city, null: false
            
            t.timestamps
        end
    end
end
