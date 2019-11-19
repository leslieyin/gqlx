class Backend::SongPoemsController < Backend::BaseController
  def index
    @q = SongPoem.ransack(params[:q])
    @song_poems = @q.result.page(params[:page])
  end

  def new
    @song_poem = SongPoem.new
  end

  def create
    @song_poem = SongPoem.new(song_poem_params)
    @song_poem.save

    respond_with @song_poem, location: -> { [ :backend, SongPoem ] }
  end

  def show
    @song_poem = SongPoem.find(params[:id])
  end

  def edit
    @song_poem = SongPoem.find(params[:id])
  end

  def update
    @song_poem = SongPoem.find(params[:id])
    @song_poem.update(song_poem_params)

    respond_with @song_poem, location: -> { [ :backend, @song_poem ] }
  end

  def destroy
    @song_poem = SongPoem.find(params[:id])
    @song_poem.destroy

    respond_with @song_poem, location: -> { [ :backend, SongPoem ] }
  end

protected
  def song_poem_params
    params.require(:song_poem).permit(:title, :dynasty, :author, :prelude, :category,
                                      content: [], notes: [], translate: [], translate_res: [])
  end
end
