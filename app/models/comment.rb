# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content_id :integer
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#

class Comment < ApplicationRecord
  belongs_to :content

  validates :name, presence: true, length: { maximum: 10}
  validates :comment, presence: true, length: { maximum: 1000}
end
