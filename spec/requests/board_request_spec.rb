require 'spec_helper'

describe 'Board requests' do
  subject { page }

  describe 'board creation' do
    before { visit 'boards/new' }

    describe 'with no attributes' do
      it 'should not create a board' do
        expect { click_button 'Create' }.not_to change(Board, :count)
      end

      describe "error messages" do
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
      it "should create a board" do
        expect { click_button "Create" }.to change(Board, :count).by(1)
      end
    end
  end
end
