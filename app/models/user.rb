class User < ApplicationRecord
  has_many :notes
  has_many :comments
  has_many :favorites

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates :password,
    length: { in: 6..20 },
    on: :create

  has_secure_password

  def self.authenticate(params)
      u = User.find_by_email(params[:email])
      if u
        if u.is_active
          u.try(:authenticate, params[:password])
        else
          return -1
        end
      else
        return nil
      end
  end

end
