describe "adding videos", :type => :feature do
  
  it "adds a new video to the videos index" do
    visit '/'
    within("#video-form") do
      fill_in 'Title', :with => 'A video title'
      fill_in 'Length', :with => '3'
      click_button 'Choose File'
    end
    click_button 'Submit'
    expect(page).to have_content 'Success'
  end
end