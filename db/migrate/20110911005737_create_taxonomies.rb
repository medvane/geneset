class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.integer :genes_count, :default => 0
      t.integer :articles_count, :default => 0
    end
    add_index :taxonomies, :genes_count
    add_index :taxonomies, :articles_count
  end
end