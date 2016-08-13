module ApartmentsHelper
  # TODO: comment me!
  #
  # Example:
  # check_only_creator_can_see(apartment with nil user, :admin) -> true
  # check_only_creator_can_see(apartment with nil user, :not_admin) -> false
  # check_only_creator_can_see(apartment with user, :admin) -> true
  # check_only_creator_can_see(apartment with user not current_user, :not_admin) -> false
  # check_only_creator_can_see(apartment with user is current_user, :not_admin) -> true
  def check_only_creator_can_see(apartment, current_user)
    (!apartment.user.nil? && current_user == apartment.user) || (!current_user.nil? && (current_user.has_role? :admin))
  end
end
