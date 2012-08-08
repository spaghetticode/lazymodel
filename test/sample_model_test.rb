require 'test_helper'
require 'fixtures/sample_model'

class SampleModelTest < ActiveSupport::TestCase
  def setup
    @model = SampleModel.new
  end

  test 'has name and surname attributes' do
    set_model_attributes
    assert_equal 'john', @model.name
    assert_equal 'doe', @model.surname
  end

  test 'has clear prefix for attributes' do
    set_model_attributes
    @model.clear_name
    @model.clear_surname
    assert_nil @model.name
    assert_nil @model.surname
  end

  test 'has ? suffix attributes' do
    @model.name = 'john'
    assert @model.name?
    assert !@model.surname?
  end

  private

  def set_model_attributes
    @model.name    = 'john'
    @model.surname = 'doe'
  end
end
