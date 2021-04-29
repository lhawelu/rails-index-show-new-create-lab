class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      flash[:success] = "Coupon successfully created"
      redirect_to @coupon
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:coupon_code, :store)
  end

end
