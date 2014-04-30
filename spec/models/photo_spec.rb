require 'spec_helper'

describe Photo do
  before do
    @photo = FactoryGirl.build(:photo)
  end

  subject { @photo }


  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:number) }
  it { should be_valid }


  describe 'when tack not present' do
    before { @photo.tack = nil }
    it { should_not be_valid }
  end

  describe 'when title too long' do
    before { @photo.title = 'a' * 256 }
    it { should_not be_valid }
  end

  context 'image' do
    describe 'when not present' do
      before { @photo.image = nil }
      it { should_not be_valid }
    end

    describe 'when not an image file' do
      before { @photo.image = File.new("#{Rails.root}/spec/fixtures/images/board.txt") }
      it { should_not be_valid }
    end
  end

end
