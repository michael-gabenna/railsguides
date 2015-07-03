class ArticlesController < ApplicationController

	#Indice de todos os arquivos.
		def index
		    @articles = Article.all
		end
	#indice_end

	#Destroy user.
		def destroy
		  @article = Article.find(params[:id])
		  @article.destroy
		 
		  redirect_to articles_path
		end	
	#destroy_end

	#Metódo que cria um novo artigo
	def new
		@article = Article.new

		if @article.save
	    	redirect_to @article
		else
			render 'new'
		end	
	end

	#Formulário para criar o artigo
	def create
		@article = Article.new(article_params)
 
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
  	end

  	def update
  		@article = Article.find(params[:id])
 
		if @article.update(article_params)
	    	redirect_to @article
		else
	    	render 'edit'
		end
  	end

  	#mostra o artigo
  	def show
	    @article = Article.find(params[:id])
	end
	def edit
	  @article = Article.find(params[:id])
	end
  	
  	private

  		def article_params
    		params.require(:article).permit(:title, :text)
 	 	end
end