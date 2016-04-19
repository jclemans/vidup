describe "Videos", :type => :feature do
  
  context "creating a new video" do
    it "adds a new video to the videos index", :js => true do
      visit '/'
      within("#video-form") do
        fill_in 'title-field', :with => 'A video title'
        fill_in 'length-field', :with => '3'
        attach_file('file-field', File.join(Rails.root, 'spec/sample_files/videos/testvid.mp4') )
      end
      click_button 'Submit'
      expect(page).to have_content 'video saved'
      expect(page).to have_content 'A video title'
    end
  end

  context "editing an existing video" do
    let!(:video){ FactoryGirl.create(:video) }
    it "updates the video attributes" do
      visit "/videos/#{video.id}/edit"
      within("#video-form") do
        fill_in 'title-field', :with => 'A new title'
      end
      click_button 'Submit'
      expect(page).to have_content 'Video was successfully updated'
      expect(page).to have_content 'A new title'
    end
  end

  context 'deleting an existing video' do
    Video.destroy_all
    let!(:video){ FactoryGirl.create(:video) }
    it 'removes the video' do
      visit '/'
      first('.actions').click_link 'remove'
      expect(page).to have_content "Video 'This is a video title' deleted"
    end
  end

end