class Backend::ArticlesController < Backend::BaseController
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    respond_with @article, location: -> { [ :backend, Article ] }
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    respond_with @article, location: -> { [ :backend, @article ] }
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_with @article, location: -> { [ :backend, Article ] }
  end

protected
  def article_params
    params.require(:article).permit(:title, :dynasty, :author, :prelude, :category, content: [], notes: [], translate: [], translate_res: [])
  end
end
