class CreateUsers < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |t|
            t.string :name, null: false
            t.string :email, null: false, unique: true
            t.string :password_digest
            t.string :phone, null: false, unique: true
            t.string :address, null: false
            t.string :role, null: false, default: 'user'

            # Associations
            t.belongs_to :location, index: true
            t.timestamps
        end
    end
end
