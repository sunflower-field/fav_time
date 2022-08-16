class Publics::RegistrationsController < Devise::RegistrationsController
  def new
   @user = User.new
  end
end
