class ListsController < ApplicationController

  before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
  end
  def show
    @movies = @list.movies
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
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
    params.require(:list).permit(:name)
  end

end
