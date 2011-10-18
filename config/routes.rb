Geneset::Application.routes.draw do
  resources :articles
  resources :genes
  resources :subjects
  match 'meshcomplete-update' => 'genes#top'
  match "/pubmed/:gene_id/:term/:rettype" => "genes#pubmed", :as => "pubmed"
  match '/about' => "page#about", :as => "about"
  match '/download' => "page#download", :as => "download"
  root :to => "page#home"
end
