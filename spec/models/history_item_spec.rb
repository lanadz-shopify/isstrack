require 'spec_helper'

describe HistoryItem do
  it { should belong_to :issue }
  it { should belong_to :user }
end
