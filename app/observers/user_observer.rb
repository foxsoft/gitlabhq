class UserObserver < ActiveRecord::Observer
  def after_create(user)
    log_info("User \"#{user.name}\" (#{user.email}) was created")

    Notify.new_user_email(user.id, user.password).deliver
  end

  def after_destroy user
    log_info("User \"#{user.name}\" (#{user.email})  was removed")
  end

  def after_save user
    if user.username_changed?
      user.namespace.update_attributes(code: user.username)
    end
  end

  protected

  def log_info message
    Gitlab::AppLogger.info message
  end
end
