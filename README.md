# Lazymodel

This rails gem helps get ActiveModel goodies without the hassle to write a ton
of code.

## Usage

Add to your gemfile:
```ruby
gem 'lazymodel'
```
Create the model class that gets ActiveModel features. The key point is having
the class inherit from Lazymodel::Base
```ruby
class Person < Lazymodel::Base
  has_attributes :name, :surname, :suffix => '?'

  validates :name, :surname, :presence => true

  private

  def attribute?(attribute)
    send(attribute).present?
  end
end
```
This will grant you the power of the following modules:
```ruby
ActiveModel::Naming
ActiveModel::Concern
ActiveModel::Validations
ActiveModel::Translations
ActiveModel::AttributeMethods
```
Via the class macro ```has_attributes``` you can define in a single call the
model attributes and its prefixed and suffixed methods. You also get reasonable
``` initialize, to_model, persisted?``` method defaults.
The class complies with ```ActiveModel::Lint::Tests``` specifications.

## Todo

Add activemodel callbacks features
