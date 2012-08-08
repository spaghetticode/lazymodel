class Person < Lazymodel::Base
  activemodel_attributes :name, :surname

  validates :name, :surname, :presence => true
end
