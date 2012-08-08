class SampleModel < Lazymodel::Base
  has_attributes :name, :surname, :prefix => 'clear_', :suffix => '?'

  private

  def clear_attribute(attribute)
    send("#{attribute}=", nil)
  end

  def attribute?(attribute)
    send(attribute).present?
  end
end
