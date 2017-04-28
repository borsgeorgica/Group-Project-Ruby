require 'geokit-rails'

class Location < ActiveRecord::Base
  acts_as_mappable
end

Location.by_distance(:origin => '100 Spear st, San Francisco, CA')
