class Mainuser < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  validate :password_must_be_present

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
  private
    def password_must_be_present
      errors.add(:password, "Missing password") unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
