require 'spec_helper'

describe 'Board requests' do
  subject { page }

  describe 'board creation' do
    before { visit 'boards/new' }

    describe 'with no attributes' do
      it 'should not create a board' do
        expect { click_button 'Create' }.not_to change(Board, :count)
      end

      describe 'error messages' do
        before { click_button 'Create' }
        it { should have_content('error') }
      end
    end

    describe 'with valid attributes' do
      before do
        fill_in 'Name', with: 'Example Name'
        fill_in 'Description', with: 'Example description'
        attach_file 'Image', "#{Rails.root}/spec/fixtures/images/board.jpg"
      end
      it 'should create a board' do
        expect { click_button "Create" }.to change(Board, :count).by(1)
      end
    end
  end

  describe 'tack creation' do
    before do
      @board = FactoryGirl.create(:board)
      visit board_path(@board)
    end

    describe 'with no attributes' do
      it 'should not create a tack' do
        expect { click_button 'Add tack' }.not_to change(Tack, :count)
      end

      pending 'error messages'
    end
    
    describe 'with valid attributes' do
      before do
        fill_in 'tack_name', with: 'Example Tack'
        fill_in 'tack_description', with: 'Example description'
        fill_in 'tack_top', with: 5
        fill_in 'tack_left', with: 5
      end
      it 'should create a tack' do
        expect { click_button 'Add tack' }.to change(Tack, :count).by(1)
      end
    end
  end
end
