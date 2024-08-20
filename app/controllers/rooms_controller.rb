class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :amount))
    if @room.save
      flash[:notice] = "部屋を新規登録しました"
      redirect_to :rooms
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
    @rents = @room.rents
    @rent = @rents.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :amount))
      flash[:notice] = "ルームIDが「#{@room.id}」の情報を更新しました"
      redirect_to :rooms
    else
      render "edit"
    end
  end
end
