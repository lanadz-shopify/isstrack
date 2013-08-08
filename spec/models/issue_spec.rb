require 'spec_helper'

describe Issue do
  it { should belong_to :department }
  it { should belong_to :user }
  it { should have_many :history_items }

end
