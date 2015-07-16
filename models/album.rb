# Album Model

class Album < ActiveRecord::Base
  has_many_and_belongs_to :photos
end
