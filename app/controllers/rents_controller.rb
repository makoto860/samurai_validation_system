class RentsController < ApplicationController
  def index
    @rents = Rent.all
  end

  def confirm
    @room = Room.find(params[:rent][:room_id])
    @user = User.find(params[:rent][:user_id])
    @check_in_date = params[:rent][:check_in_date]
    @check_out_date = params[:rent][:check_out_date]
    @total_people = params[:rent][:total_people]
    @total_day = params[:rent][:total_day]
    @total_amount = params[:rent][:total_amount]
    @rent = Rent.find_by(params[:id])
    @room = Room.find_by(params[:id])
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.total_day = @rent.sum_of_days
    @rent.total_amount = @rent.sum_of_amount

    if @rent.save
      redirect_to rents_url, notice: '予約が確定しました。'
    else
      @room = @rent.room
      @user = @rent.user
      @check_in_date = @rent.check_in_date
      @check_out_date = @rent.check_out_date
      @total_people = @rent.total_people
      render :comfirm, status: :unprocessable_entity
    end
  end

  private
    def rent_params
      params.require(:rent).permit(:check_in_date, :check_out_date, :total_people, :total_day, :total_amount, :room_id, :user_id).
             merge(user_id: current_user.id, room_id: params[:room_id])
    end
end
