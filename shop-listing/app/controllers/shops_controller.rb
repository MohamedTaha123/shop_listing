# frozen_string_literal: true

class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy like_shop unlike_shop]
  before_action :authenticate_user! , only: %i[ new create like_shop unlike_shop]
  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all.order(:distance, :desc)
  end

  # GET /shops/1
  # GET /shops/1.json
  def show; end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit; end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like_shop
    @shop.liked_by current_user
    redirect_back(fallback_location: shops_url)
  end

  def unlike_shop
    @shop.downvote_from current_user
    redirect_back(fallback_location: shops_url)
  end

  def preferred_shops
    @preferred_shops = current_user.find_up_voted_items
  end

  def nearby_shops; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shop
    @shop = Shop.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shop_params
    params.require(:shop).permit(:name, :distance, :shop_image, :user_id)
  end
end
