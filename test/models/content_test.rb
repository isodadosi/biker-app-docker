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

require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
