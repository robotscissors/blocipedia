class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "You created a new wiki!"
      redirect_to [@wiki]
    else
      flash[:alert] = "There was an error when we tried to save it. Try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "Your update was saved correctly!"
      redirect_to [@wiki]
    else
      flash[:alert] = "There was an error when we tried to save it. Try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "The wiki was deleted!"
      redirect_to wikis_path
    else
      flash[:alert] = "Oops! Something happened and we weren't able to delete it."
      render :show
    end

  end
end
