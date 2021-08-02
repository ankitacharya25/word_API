class CreateDefinitions < ActiveRecord::Migration[6.1]
  def change
    create_table :definitions do |t|
      t.string :sentence
      t.integer :word_id

      t.timestamps
    end
  end
end
