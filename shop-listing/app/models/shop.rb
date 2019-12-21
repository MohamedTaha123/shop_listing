# frozen_string_literal: true

class Shop < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  mount_uploader :shop_image, ShopImageUploader
  acts_as_votable
  validates_presence_of :shop_image, :name, :distance
end
