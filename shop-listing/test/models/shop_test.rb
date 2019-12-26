# frozen_string_literal: true

require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @shop = Shop.new(name: 'Shop1', distance: 100)
  end
  test 'valid shop' do
    assert @shop.valid?
  end
  test 'invalid shop without name' do
    @shop.name = nil
    refute @shop.valid?, 'saved shop without a name'
    assert_not_nil @shop.errors[:name], 'no validation error for name present'
  end
  test 'invalid shop without distance' do
    @shop.distance = nil
    refute @shop.valid?, 'saved shop without a distance'
    assert_not_nil @shop.errors[:distance]
  end
end
