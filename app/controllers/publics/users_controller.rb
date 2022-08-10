class Publics::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  private

  def user_params

  params.require(:user).permit(:name, :introduction, :email)

  end
end
