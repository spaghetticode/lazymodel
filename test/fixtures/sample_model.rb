class SampleModel < Lazymodel::Base
  activemodel_attributes :name, :surname, :prefix => 'clear_', :suffix => '?',
    :callbacks => {:before_save => :capitalize_attributes, :after_update => [:notify_admin, :update_genealogy]}


  def save
    run_callbacks :save do
      # saving...
    end
  end

  def update
    run_callbacks :update do
      # updating...
    end
  end


  private

  def clear_attribute(attribute)
    send("#{attribute}=", nil)
  end

  def attribute?(attribute)
    send(attribute).present?
  end

  def capitalize_attributes
    self.name = name.capitalize
    self.surname = surname.capitalize
  end

  def notify_admin
    #...
  end

  def update_genealogy
    #...
  end
end
