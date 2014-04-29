require 'spec_helper'

describe Tack do
  before do
    @tack = FactoryGirl.build(:tack)
  end

  subject { @tack }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:top) }
  it { should respond_to(:left) }
  it { should be_valid }

  describe 'when board not present' do
    before { @tack.board = nil }
    it { should_not be_valid }
  end

  context 'top' do
    describe 'when not present' do
      before { @tack.top = nil }
      it { should_not be_valid }
    end
    describe 'when not within the height of its board' do
      before { @tack.top = @tack.board.height }
      it { should_not be_valid }
    end
  end

  context 'left' do
    describe 'when not present' do
      before { @tack.left = nil }
      it { should_not be_valid }
    end
    describe 'when not within the width of its board' do
      before { @tack.left = @tack.board.width }
      it { should_not be_valid }
    end
  end

  describe 'photo associations' do
    before { @tack.save }
    let!(:older_photo) do
      FactoryGirl.create(:photo, tack: @tack, created_at: 2.days.ago)
    end
    let!(:newer_photo) do
      FactoryGirl.create(:photo, tack: @tack, created_at: 1.day.ago)
    end

    it 'should have the right photos in the right order' do
      expect(@tack.photos.to_a).to eq [older_photo, newer_photo]
    end

    it 'should destroy associated photos' do
      photos = @tack.photos.to_a
      @tack.destroy
      expect(photos).not_to be_empty
      photos.each do |photo|
        expect(Photo.where(id: photo.id)).to be_empty
      end
    end
  end
end
