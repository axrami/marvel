class CharactersController < ApplicationController
  @@public_key = "785223d283d19e07e78832bec1b39ea8"
  @@private_key = "37dd0b9e989fff60ebdc03a284bd743af963f589"
  @@ts = Time.now.to_i.to_s

  def get_characters
    @results = Oj.load RestClient.get("http://gateway.marvel.com/v1/public/characters", { params: {ts: @@ts, limit: 20, apikey: @@public_key, hash: Digest::MD5.hexdigest(@@ts + @@private_key + @@public_key)}, accept: :json })
    @results["data"]["results"].map do |character|
      Character.create(name: character["name"],
                       marvel_id: character["id"],
                       description: character["description"],
                       thumbnail: get_thumbnail(character)
      )
    end
    @characters = Character.all
  end

# only use when building a new databaase
  def api_key_params(offset = nil)
    ts = Time.now.to_i.to_s
    if offset
      {ts: ts, limit: 100, apikey: @@public_key, hash: Digest::MD5.hexdigest(ts + @@private_key + @@public_key), offset: offset}
    else
      {ts: ts, limit: 100, apikey: @@public_key, hash: Digest::MD5.hexdigest(ts + @@private_key + @@public_key)}
    end
  end

# only use when building a new database
  def get_all_characters
    (1..100).to_a.each do |offset|
      offset = offset * 100

      results = Oj.load RestClient.get("http://gateway.marvel.com/v1/public/characters", { params: api_key_params(offset), accept: :json })

      # if no results were returned, stop loop and stop method
      break if results["data"]["results"] == []

      results["data"]["results"].map do |character|
        Character.create(marvel_id: character["id"],
                         name: character["name"],
                         description: character["description"],
                         thumbnail: get_thumbnail(character)
        )
      end
    end
  end

# create thumbnail attr or places default if none from marvel
   def get_thumbnail character
    if character["thumbnail"] and character["thumbnail"]["path"]
      return character["thumbnail"]["path"] + "." + character["thumbnail"]["extension"]
    else
      return "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
    end
   end

# Search method, checks models if false create request to marvel
  def search
    @characters = Character.where("name LIKE '%#{params[:query]}%'")
    # if Character.find_by name: @character
    #   render 'index'
    # else
    #   @results = Oj.load RestClient.get 'http://gateway.marvel.com:80/v1/public/characters', :params => { :name => params[:query],:ts => @@ts, :limit => 1, :apikey => @@public_key, :hash => Digest::MD5.hexdigest(@@ts + @@private_key + @@public_key)}
    #   @results["data"]["results"].map do |character|
    #     Character.create(name: character["name"],
    #                      marvel_id: character["id"],
    #                      description: character["description"],
    #                      thumbnail: get_thumbnail(character)
    #     )
    #   end
      # @results = @results
      render 'characters/index'
    # end
  end

# Views
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
