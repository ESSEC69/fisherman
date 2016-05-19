module ApplicationHelper

  def resource_name

  :user

  end

  def resource

  @resource ||= User.new

  end

  def provider
    :facebook
  end

  def devise_mapping

  @devise_mapping ||= Devise.mappings[:user]

  end

end
