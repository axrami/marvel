class Character < ActiveRecord::Base
  validates :marvel_id, presence: true, uniqueness: true

  def self.get_thumbnail character
   if character["thumbnail"] and character["thumbnail"]["path"]
     return character["thumbnail"]["path"] + "." + character["thumbnail"]["extension"]
   else
     return "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
   end
  end
end
