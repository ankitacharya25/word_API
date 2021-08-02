class CreateRelatedWords < ActiveRecord::Migration[6.1]
  def change
    create_table :related_words do |t|
      t.string :related_word
      t.integer :word_id

      t.timestamps
    end
  end
end
