# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ActiveRecord::Base
  attr_accessible :title, as: :seed
  has_many :issues
end
