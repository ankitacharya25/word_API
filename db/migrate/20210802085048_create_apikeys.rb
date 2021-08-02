class CreateApikeys < ActiveRecord::Migration[6.1]
  def change
    create_table :apikeys do |t|
      t.string :api_key
      t.integer :count
      t.integer :user_id

      t.timestamps
    end
  end
end
