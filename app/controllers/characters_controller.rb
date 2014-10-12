class CharactersController < ApplicationController
  def search
    @characters = Character.where("name LIKE '%#{params[:query]}%'")
    render 'characters/index'
  end

  def index
    if params[:search]
      @characters = Character.where("name LIKE '#{params[:search]}%'")
    else
      no_thumb = "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
      @characters = Character.where.not(thumbnail: no_thumb).limit(20)
      @characters = @characters.shuffle.slice(0,8)
    end
  end

  def show
    @character = Character.find(params[:id])
    puts @character.inspect
  end
end
