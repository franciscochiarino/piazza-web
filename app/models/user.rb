class User < ApplicationRecord
  include Authentication

  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships

  before_validation :strip_spaces

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }

  private

    def strip_spaces
      self.name = self.name&.strip
      self.email = self.email&.strip
    end
end
