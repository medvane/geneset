#require Meshcomplete::Engine.root.join('app', 'models', 'subject')
class Subject < ActiveRecord::Base
  has_many :article_subjects
  has_many :articles, :through => :article_subjects
  has_many :gene_subjects, :include => [:gene => :taxonomy]
  has_many :genes, :through => :gene_subjects
end
