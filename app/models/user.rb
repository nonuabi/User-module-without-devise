class User < ApplicationRecord

    attr_accessor :password

    validates :first_name, :last_name, :email, :date_of_birth, presence: true
    validates :email, uniqueness: true, length: {in: 5..50}
    validates :password,presence: true, length: {in: 6..20}
    validates :mobile_number, presence: true, length: {is: 10}

    before_save :encyrpt_password

    private
        def encyrpt_password
            return if password.blank?
            self.hashed_password = encyrpt(password)
        end

        def encyrpt(string)
            Digest::SHA1.hexdigest(string)
        end

end
