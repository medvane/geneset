class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.string :source
      t.integer :pubyear, :limit => 2
      t.text :abstract
    end
    add_index :articles, :pubyear
  end
end