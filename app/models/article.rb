class Article < ActiveRecord::Base
  has_many :article_genes
  has_many :genes, :through => :article_genes
  has_many :article_subjects
  has_many :subjects, :through => :article_subjects
end
