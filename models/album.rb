# Album Model

class Album < ActiveRecord::Base
  has_and_belongs_to_many :photos
end
