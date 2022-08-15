class Publics::HomesController < ApplicationController
  def top
  end
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to publics_user_path(current_user), notice: 'welcome to guest!!'
  end
end
