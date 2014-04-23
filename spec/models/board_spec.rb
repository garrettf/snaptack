require 'spec_helper'

describe Board do
  before do
    @board = FactoryGirl.build(:board)
  end
  subject { @board }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:width) }
  it { should respond_to(:height) }
end
