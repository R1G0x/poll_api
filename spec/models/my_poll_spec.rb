require 'rails_helper'

RSpec.describe MyPoll, type: :model do
  it { should validate_presence_of :title }
  it { should_not allow_value("a").for(:title) }
  it { should validate_length_of(:title).is_at_least(10) }
  it { should belong_to(:user)}
  it { should validate_presence_of(:description) }
end
