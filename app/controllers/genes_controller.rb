class GenesController < ApplicationController
  def index
    @genes = Gene.order("articles_count desc").paginate(:page => params[:page], :per_page => 15).includes(:taxonomy)
    @taxonomy_id = params[:taxonomy_id]
    @genes = @genes.where(:taxonomy_id => @taxonomy_id) if @taxonomy_id.present?
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @genes }
    end
  end

  def show
    @gene = Gene.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gene }
    end
  end

  def top
    @genes = []
    if @subject_ids.present?
      if @subject_ids.size == 1
        @genes = GeneSubject.where(:subject_id => @subject_ids.first).order("articles_count desc").limit(30).includes(:gene => :taxonomy).map {|gs| gs.gene.matched_articles_count = gs.articles_count; gs.gene}
      else
        article_ids = ArticleSubject.select("article_id, count(distinct(subject_id)) AS subjects_count").where(:subject_id => @subject_ids).group(:article_id).having(" count(distinct(subject_id)) = #{@subject_ids.size}").map{|as| as.article_id}
        ag = ArticleGene.where(:article_id => article_ids).group(:gene_id).select("gene_id, count(distinct(article_id)) AS articles_count").order("articles_count desc").limit(30).includes(:gene => :taxonomy)
        @genes = ag.map {|ag| ag.gene.matched_articles_count = ag.articles_count; ag.gene}
      end
    end
    render :layout => false
  end

  def pubmed
    gene_id = params[:gene_id]
    term = params[:term]
    rettype = params[:rettype]
    eutils = Eutils.new("medvane.genes", "joon@medvane.org")
    linkset = eutils.elink([gene_id], "cmd" => "neighbor_history", "dbfrom" => "gene", "linkname" => "gene_pubmed", "term" => term)
    webenv = linkset["LinkSet"]["WebEnv"]
    query_key = linkset["LinkSet"]["LinkSetDbHistory"]["QueryKey"]
    #pmids = linkset["LinkSet"]["LinkSetDb"]["Link"].map{|link| link["Id"]}.join(",")
    redirect_to("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&retmode=html&rettype=#{rettype}&WebEnv=#{webenv}&query_key=#{query_key}")
  end
end
