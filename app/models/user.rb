# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    has_secure_password

    validates :name,
        presence: true,
        uniqueness: true,
        length: { maximum: 16 }
    validates :password,
        length: { minimum: 4 }

    def self.search(search)
        if search
            where(['name LIKE ?', "%#{search}%"]) 
        else
            all
        end
    end
end
