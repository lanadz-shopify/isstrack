class Department < ActiveRecord::Base
  attr_accessible :title, as: :seed
  has_many :issues
end
