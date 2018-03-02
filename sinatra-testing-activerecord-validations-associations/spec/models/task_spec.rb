require 'spec_helper'

describe Task do
  # check out this dope association test
  it { should belong_to :user }

  it { should have_valid(:title).when("a title") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }
end
