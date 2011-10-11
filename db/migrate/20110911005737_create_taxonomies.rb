class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.integer :genes_count, :default => 0
    end
    add_index :taxonomies, :genes_count
  end
end