module CurrentUser
  extend ActiveSupport::Concern

  def current_user
    # Implementing guest user using null object pattern
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guestuser@email.com"
    guest
  end
end
