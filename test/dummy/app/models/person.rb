class Person < Lazymodel::Base
  has_attributes :name, :surname

  validates :name, :surname, :presence => true
end
