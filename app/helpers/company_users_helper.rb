module CompanyUsersHelper
  def new_record?(user)
    if !user.persisted?
      true
    else
      user.request_change_password
    end
  end
end
