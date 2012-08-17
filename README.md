# Lazymodel

[![Build Status](https://secure.travis-ci.org/spaghetticode/lazymodel.png)](http://travis-ci.org/spaghetticode/lazymodel)

This rails gem helps get ActiveModel goodies without the hassle to write a ton
of code.

## Usage

Add to your gemfile:
```ruby
gem 'lazymodel'
```

Create the model class that gets ActiveModel features. The key point is having
the class inherit from ```Lazymodel::Base```

```ruby
class Person < Lazymodel::Base
  activemodel_attributes :name, :surname, :suffix => '?', :callbacks => {
    :before_create => :capitalize_attributes,
    :after_update  => [:notify_admin, :check_data]
  }

  validates :name, :surname, :presence => true

  def save
    run_callbacks {# saving...}
  end

  def update
    run_callbacks {# updating...}
  end

  private

  def attribute?(attribute)
    send(attribute).present?
  end

  def check_data; end
  def notify_admin; end
  def capitalize_attributes; end
end
```

This will grant you the power of the following modules:

```ruby
ActiveModel::Naming
ActiveModel::Concern
ActiveModel::Callbacks
ActiveModel::Validations
ActiveModel::AttributeMethods
```

Via the class macro ```activemodel_attributes``` you can define in a single call the
model attributes and its prefixed and suffixed methods. You also get reasonable
``` initialize, to_model, persisted?, attributes``` method defaults.

The class complies with ```ActiveModel::Lint::Tests``` specifications.
