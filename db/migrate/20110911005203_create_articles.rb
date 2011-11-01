class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.string :source
      t.date :pubdate
      t.text :abstract
    end
  end
end
