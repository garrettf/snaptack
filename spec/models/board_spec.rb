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
  it { should respond_to(:image) }
  it { should be_valid }

  describe 'when name is not present' do
    before { @board.name = ' ' }
    it { should_not be_valid }
  end

  context 'image' do
    describe 'when not present' do
      before { @board.image = nil }
      it { should_not be_valid }
    end

    describe 'when not an image file' do
      before { @board.image = File.new("#{Rails.root}/spec/fixtures/images/board.txt") }
      it { should_not be_valid }
    end
  end

  describe 'width' do
    before { @board.save }
    it 'should be generated' do
      expect(@board.width).to_not be_nil
    end
  end

  describe 'height' do
    before { @board.save }
    it 'should be generated' do
      expect(@board.height).to_not be_nil
    end
  end

  describe 'tack associations' do
    before { @board.save }
    let!(:tack) do
      FactoryGirl.create(:tack, :board => @board)
    end

    it 'should have the correct tacks' do
      expect(@board.tacks.first).to eq tack
    end

    it 'should destroy associated tacks' do
      t = @board.tacks.first
      @board.destroy
      expect(t).to_not be_nil
      expect(Tack.where(:id => t.id)).to be_empty
    end
  end
end
