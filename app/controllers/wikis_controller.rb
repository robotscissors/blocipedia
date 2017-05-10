class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show

  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "You created a new wiki!"
    else
      flash[:alert] = "There was an error when we tried to save it. Try again."
      render :new
    end
  end

  def edit
  end
end
