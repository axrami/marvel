class Series < ActiveRecord::Base
  validates :series_id, presence: true, uniqueness: true

  def self.get_thumbnail series
   if series["thumbnail"] and series["thumbnail"]["path"]
     return series["thumbnail"]["path"] + "." + series["thumbnail"]["extension"]
   else
     return "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
   end
  end

  def self.get_creators series
    if series["creators"]
      creators = series["creators"]
      return creators.to_json
    end
  end

  def self.get_characters series
    if series["characters"]
      characters = series["characters"]
      return characters.to_json
    end
  end

end
