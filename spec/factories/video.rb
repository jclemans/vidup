FactoryGirl.define do
  factory :video do
    title "This is a video title"
    length "33"
    format "mp4"
    attachment_file_name { 'testvid.mp4' }
    attachment_content_type { 'video/mp4' }
    attachment_file_size { 5120 }
  end
end