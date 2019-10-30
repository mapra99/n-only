# frozen_string_literal: true

class User < ApplicationRecord
  before_create :create_remember_token
  has_many :posts
  has_secure_password

  private

  def create_remember_token
    token = SecureRandom.urlsafe_base64
    token_digest = Digest::SHA1.hexdigest token
    self.remember_token = token_digest
  end
end
