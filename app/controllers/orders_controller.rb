class OrdersController < ApplicationController

  before_action :authenticate!

  def create
    # render html: params
    # 找到課程內容
    @course = Course.find(params[:course_id])
    # 課程訂單
    @order = @course.orders.build(clean_params)

    if @order.save
      # 刷卡
      redirect_to root_path, notice: '課程購買成功'
    else
      #render
    end
    
  end

  private
  def clean_params
    params.require(:order).permit(:recipient, :address).merge(user: current_user)
  end
end
