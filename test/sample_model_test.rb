require 'test_helper'
require 'fixtures/sample_model'

class SampleModelTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = SampleModel.new
    set_model_attributes
  end

  test 'has name and surname attributes' do
    assert_equal 'john', @model.name
    assert_equal 'doe', @model.surname
  end

  test 'has clear prefix for attributes' do
    @model.clear_name
    @model.clear_surname
    assert_nil @model.name
    assert_nil @model.surname
  end

  test 'has ? suffix attributes' do
    @model.clear_surname
    assert @model.name?
    assert !@model.surname?
  end

  test 'accepts attributes on initialization' do
    model = SampleModel.new(:name => 'john')
    assert_equal 'john', model.name
  end

  test 'has expected attributes' do
    attributes = {
      'name'    => 'john',
      'surname' => 'doe'
    }
    assert_empty attributes.keys - @model.attributes.keys
    assert_empty attributes.values - @model.attributes.values
  end

  private

  def set_model_attributes
    @model.name    = 'john'
    @model.surname = 'doe'
  end
end
