require 'test_helper'
require 'mongoid'

class MongoidDecimalTest < Minitest::Test

  include MongoidDecimal

  class ::TestDocument
    include Mongoid::Document
    field :number, type: MongoidDecimal::Decimal
  end

  def setup
    config_file = File.dirname(__FILE__) + '/mongoid.yml'
    Mongoid.load!(config_file, :test)
    TestDocument.collection.drop
  end

  def teardown
    TestDocument.collection.drop
  end

  def test_that_it_has_a_version_number
    refute_nil ::MongoidDecimal::VERSION
  end

  def test_type_serialization_deserialization
    TestDocument.create!(number: Decimal.new('2.1'))
    assert_equal(TestDocument.first.number, Decimal.new('2.1'))
  end

  def test_that_it_is_possible_to_find_based_on_decimal
    TestDocument.create!(number: Decimal.new('2.1'))
    doc = TestDocument.find_by(number: Decimal.new('2.1'))
    assert_equal(doc.number, Decimal.new('2.1'))
  end

  def test_that_it_is_possible_to_find_using_a_string
    TestDocument.create!(number: Decimal.new('2.1'))
    doc = TestDocument.find_by(number: '2.1')
    assert_equal(doc.number, Decimal.new('2.1'))
  end

  def test_that_field_has_type_decimal
    TestDocument.create!(number: Decimal.new('2.1'))
    assert_equal(TestDocument.where({number: {'$type' => 'decimal'}}).count, 1)
  end

end
