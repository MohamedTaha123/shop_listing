# frozen_string_literal: true

class Shop < ApplicationRecord
  belongs_to :user
  mount_uploader :shop_image, ShopImageUploader
end
