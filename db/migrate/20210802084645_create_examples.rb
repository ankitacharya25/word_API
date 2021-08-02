class CreateExamples < ActiveRecord::Migration[6.1]
  def change
    create_table :examples do |t|
      t.string :example
      t.integer :word_id

      t.timestamps
    end
  end
end
