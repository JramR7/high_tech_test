class CreateCreditCards < ActiveRecord::Migration[5.2]
    def change
        create_table :credit_cards do |t|
            t.integer :truncated_num, null: false
            t.date :expiration_date, null: false
            t.string :titular_name, null: false
            t.string :billing_address, null: false

            # Associations
            t.belongs_to :user, index: true
            t.belongs_to :bank, index: true
            t.timestamps
        end
    end
end
