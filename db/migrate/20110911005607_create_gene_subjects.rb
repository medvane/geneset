class CreateGeneSubjects < ActiveRecord::Migration
  def change
    create_table :gene_subjects do |t|
      t.integer :gene_id
      t.integer :subject_id
      t.integer :articles_count, :default => 0
    end
    add_index :gene_subjects, [:gene_id, :articles_count]
    add_index :gene_subjects, [:subject_id, :articles_count]
  end
end