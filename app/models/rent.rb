class Rent < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :total_people, presence: true

  def save_rent(rent, rent_params)
    rent.check_in_date = rent_params[:check_in_date]
    rent.check_out_date = rent_params[:check_out_date]
    rent.total_people = rent_params[:total_people]
    rent.total_day = rent_params[:total_day]
    rent.total_amount = rent_params[:total_amount]
    rent.user_id = rent_params[:user_id]
    rent.room_id = rent_params[:room_id]
    save
  end

  def sum_of_days
    (check_out_date.to_date - check_in_date.to_date).to_i if check_in_date.present? && check_out_date.present?
  end

  def sum_of_amount
    (room.amount * total_people * sum_of_days).to_i if check_in_date.present? && check_out_date.present?
  end
end
