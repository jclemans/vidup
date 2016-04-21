require 'spec_helper'

describe Video do
  it { should have_attached_file(:attachment) }
  it { should validate_attachment_presence(:attachment) }
  it { should validate_attachment_content_type(:attachment).
                allowing('video/mp4').
                rejecting('text/plain', 'text/xml', 'image/jpg', 'image/gif') }
  it { should validate_attachment_size(:attachment).
                less_than(50.megabytes) }
  it { should validate_presence_of(:title) }

  it 'sets values for title, format, and duration when created' do
    video = FactoryGirl.create(:video)
    expect(video.title).to eq 'This is a video title'
    expect(video.format).to eq "Mp4"
    expect(video.length).to eq 9
  end
end