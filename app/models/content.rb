# == Schema Information
#
# Table name: contents
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  image      :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  name       :string(255)
#  place      :string(255)
#  prefecture :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Content < ApplicationRecord
    has_many :comments, dependent: :delete_all
   

    validates :title, presence: true, length: {maximum: 30}

    mount_uploader :image, ImageUploader

    # geocoding
    def address
        [street, city, state, country].compact.join(', ')
    end

    #lat, lonというカラムを設ける場合
    geocoded_by :address, latitude: :lat, longitude: :lon  # ActiveRecord


    def self.search(search)
      if search
        where(['place LIKE ?', "%#{search}%"]) 
      else
        all
      end
    end

    def self.search_my_content(search)
      if search
            where(['name LIKE ?', "%#{search}%"]) 
        else
            all
        end
    end
end
