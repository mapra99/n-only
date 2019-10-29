module ApplicationHelper
  def set_remember_token
    token = SecureRandom.urlsafe_base64
    Digest::SHA1.hexdigest token
  end
end
