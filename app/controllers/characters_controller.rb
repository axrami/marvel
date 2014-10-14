class CharactersController < ApplicationController
  def search
    @characters = Character.where("name LIKE '%#{params[:query]}%'").paginate(:page => params[:page], :per_page => 20)
    render 'characters/index'
  end

  def index
    if params[:search]
      @characters = Character.where("name LIKE '%#{params[:query]}%'").paginate(:page => params[:page], :per_page => 20)
    elsif params[:letter]
      @characters = Character.where("name LIKE '#{params[:letter]}%'").paginate(:page => params[:page], :per_page => 20)
    else
      no_thumb = "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
      @characters = Character.where.not(thumbnail: no_thumb).limit(20)
      @characters = @characters.shuffle.slice(0,8)
      @characters = Character.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @character = Character.find(params[:id])
  end
end
