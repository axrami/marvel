class ComicController < ApplicationController
  @@public_key = "785223d283d19e07e78832bec1b39ea8"
  @@private_key = "37dd0b9e989fff60ebdc03a284bd743af963f589"
  @@ts = Time.now.to_i.to_s

  def get_characters
    @results = Oj.load RestClient.get("http://gateway.marvel.com:80/v1/public/comics", { params: {ts: @@ts, limit: 20, apikey: @@public_key, hash: Digest::MD5.hexdigest(@@ts + @@private_key + @@public_key)}, accept: :json })
    @results["data"]["results"].map do |character|
      Comic.create(name: character["name"],
                       marvel_id: character["id"],
                       description: character["description"],
                       thumbnail: get_thumbnail(character)
      )
    end
    @characters = Character.all
  end


  def index
  end

  def show
  end

end
