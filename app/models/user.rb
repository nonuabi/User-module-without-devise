class User < ApplicationRecord

    attr_accessor :password

    validates :first_name, :last_name, :email, :date_of_birth, presence: true
    validates :email, uniqueness: true, length: {in: 5..50}
    validates :password,presence: true, length: {in: 6..20}
    validates :mobile_number, presence: true, length: {is: 10}

    before_save :encrypt_password

    def self.authenticate(email, password)
        user = find_by_email(email)
        return user if user && user.password_valid?(password)
    end

    def password_valid?(password)
        self.hashed_password == encrypt(password)
    end

    private
        def encrypt_password
            return if password.blank?
            self.hashed_password = encrypt(password)
        end

        def encrypt(string)
            Digest::SHA1.hexdigest(string)
        end

end
