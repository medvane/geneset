class CreateArticleSubjects < ActiveRecord::Migration
  def change
    create_table :article_subjects do |t|
      t.integer :article_id
      t.integer :subject_id
    end
    add_index :article_subjects, :article_id
    add_index :article_subjects, [:subject_id, :article_id], :unique => true
  end
end