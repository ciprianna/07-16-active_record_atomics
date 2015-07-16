# Photographer Model

class Photographer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
