class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.integer :subject_id
      t.string :term
    end
    add_index :synonyms, :subject_id
    add_index :synonyms, :term
  end
end