class Comic < ActiveRecord::Base
  validates :comic_id, presence: true, uniqueness: true

  def self.get_thumbnail comic
   if comic["thumbnail"] and comic["thumbnail"]["path"]
     return comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
   else
     return "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
   end
  end
end
