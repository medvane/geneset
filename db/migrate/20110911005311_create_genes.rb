class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.integer :taxonomy_id
      t.string :symbol
      t.string :name
      t.text :synonyms
      t.string :chromosome
      t.string :map_location
      t.integer :articles_count, :default => 0
    end
    add_index :genes, :symbol
    add_index :genes, :articles_count
    add_index :genes, [:taxonomy_id, :articles_count]
  end
end