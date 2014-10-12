require 'rest-client'
require 'oj'
require 'digest'

class MarvelApi
  @@public_key = "785223d283d19e07e78832bec1b39ea8"
  @@private_key = "37dd0b9e989fff60ebdc03a284bd743af963f589"

  def self.all_characters
    characters = []

    (0..100).to_a.each do |offset|
      offset = offset * 100

      results = Oj.load RestClient.get("http://gateway.marvel.com/v1/public/characters", { params: self.api_key_params(offset), accept: :json })

      # if no results were returned, stop loop and stop method
      break if results["data"]["results"] == []

      characters.concat(results["data"]["results"])
    end

    characters
  end

  def self.api_key_params(offset = nil)
    ts = Time.now.to_i.to_s
    if offset
      {ts: ts, limit: 100, apikey: @@public_key, hash: Digest::MD5.hexdigest(ts + @@private_key + @@public_key), offset: offset}
    else
      {ts: ts, limit: 100, apikey: @@public_key, hash: Digest::MD5.hexdigest(ts + @@private_key + @@public_key)}
    end
  end

  def self.all_comics
    comics = []

    (0..100).to_a.each do |offset|
      offset = offset * 100

      results = Oj.load RestClient.get("http://gateway.marvel.com:80/v1/public/comics", { params: self.api_key_params(offset), accept: :json })

      # if no results were returned, stop loop and stop method
      break if results["data"]["results"] == []

      comics.concat(results["data"]["results"])

    end

    comics

  end


end
