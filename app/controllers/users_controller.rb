class UsersController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :password, :password_confirmation,
                                 :last_name, :first_name, :last_name_kana, :first_name_kana,
                                 :birth_date)
  end
end
