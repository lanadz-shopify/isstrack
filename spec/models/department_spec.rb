# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Department do
  it { should have_many :issues }

end
