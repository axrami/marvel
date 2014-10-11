class Character < ActiveRecord::Base
  validates :marvel_id, presence: true, uniqueness: true
end
