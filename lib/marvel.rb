
require 'rest-client'
require 'oj'
require 'digest'

class Marvel

  def self.api_key_params()
    public_key = "785223d283d19e07e78832bec1b39ea8"

    private_key = "37dd0b9e989fff60ebdc03a284bd743af963f589"
    ts = Time.now.to_i.to_s
      {ts: ts, limit: 2, apikey: public_key, hash: Digest::MD5.hexdigest(ts + private_key + public_key)}
  end

  def self.get_characters
    (1..100).to_a.each do |offset|
      offset = offset * 100

      results = Oj.load RestClient.get("http://gateway.marvel.com/v1/public/characters", { params: self.api_key_params(), accept: :json })
      puts results
      # if no results were returned, stop loop and halt method
      break if results["data"]["results"] == []

      results["data"]["results"].map do |character|
        Character.create(marvel_id: character["id"],
                         name: character["name"],
                         description: character["description"],
                         resource_url: character["resourceURI"],
                         thumbnail: character["thumbnail"]["path"] + "." + character["thumbnail"]["extension"]
        )

      end
    end

    def something
      puts 'These are letters'
    end

  end
end



# results = Oj.load RestClient.get("http://gateway.marvel.com/v1/public/characters", { params: api_key_params(), accept: :json })
# puts results
