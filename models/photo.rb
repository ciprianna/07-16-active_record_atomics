# Photo Model

class Photo < ActiveRecord::Base
  has_many_and_belongs_to :albums
end
