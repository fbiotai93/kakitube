# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Report, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
