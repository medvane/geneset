class CreateArticleGenes < ActiveRecord::Migration
  def change
    create_table :article_genes do |t|
      t.integer :article_id
      t.integer :gene_id
    end
    add_index :article_genes, [:article_id, :gene_id], :unique => true
    add_index :article_genes, [:gene_id, :article_id], :unique => true
  end
end