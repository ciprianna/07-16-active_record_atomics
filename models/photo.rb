# Photo Model

class Photo < ActiveRecord::Base
  has_and_belongs_to_many :albums
end
