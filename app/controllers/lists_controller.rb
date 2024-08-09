class ListsController < ApplicationController

  before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
  end
  def show
    @movies = @list.movies
    @bookmark = Bookmark.new

    if @list.photo.attached?
      @imgid = @list.photo.key
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
      #redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name, :photo)
  end


end
