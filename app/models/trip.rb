class Trip < ActiveRecord::Base
  has_many :trip_items, dependent: :destroy
end
