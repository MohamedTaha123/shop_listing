# frozen_string_literal: true

require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
    @user = users(:bob)
  end

  test 'should get index' do
    get shops_url
    assert_response :success
  end

  test 'should get new' do
    get new_shop_url
    assert_response :redirect
  end

  test 'should create shop' do
    sign_in users(:bob)
    assert_difference('Shop.count') do
      post shops_url, params: { shop: { distance: 100,
                                        name: 'Shop3',
                                        shop_image: 'Shop Image'
                                         } }
    end

    assert_redirected_to shop_url(Shop.last)
  end

  test 'should show shop' do
    get shop_url(@shop)
    assert_response :success
  end

end
