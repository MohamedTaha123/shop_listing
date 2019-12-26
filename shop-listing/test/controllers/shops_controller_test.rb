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
                                        shop_image: 'Shop Image' } }
    end

    assert_redirected_to shop_url(Shop.last)
  end

  test 'should show shop' do
    get shop_url(@shop)
    assert_response :success
  end

  test 'should  get preferred shops if  logged in' do
    sign_in @user
    get preferred_url
    assert_response :success
  end

  test 'should not get preferred shops if logged out' do
    sign_out @user
    get preferred_url
    assert_response :redirect
  end

  test 'should upvote a shop' do
    sign_in @user
    assert_difference('@user.find_up_voted_items.count') do
      put like_shop_url(@shop)
    end
    assert_redirected_to shops_url
  end

  test 'should downvote a shop' do
    sign_in @user
    assert_difference('@user.find_down_voted_items.count') do
      put unlike_shop_url(@shop)
    end
    assert_redirected_to shops_url
  end

  test 'should not upvote a shop when logged out' do
    sign_out @user
    put like_shop_url(@shop)
    assert_response :redirect
  end

  test 'should not downvote a shop when logged out' do
    sign_out @user
    put unlike_shop_url(@shop)
    assert_response :redirect
  end

  test 'should get preferred shops when logged in ' do
    sign_in @user
    put like_shop_url(@shop)
    assert_equal(1, @shop.votes_for.size) do
      get preferred_url
    end
  end
end
