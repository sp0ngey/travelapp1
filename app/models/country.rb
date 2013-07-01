class Country < ActiveRecord::Base
  has_many :locations

  before_destroy :ensure_not_referenced_by_any_location



  private

  # ensure that there are no locations referencing the country being deleted. If returns false then the row won't be destroyed.
  def ensure_not_referenced_by_any_location
    if locations.empty?
      return true
    else
      errors.add(:base, 'This country is referenced by a location')
      return false
    end
  end
end
