FactoryGirl.define do
  factory :video do
    title "This is a video title"
    attachment_file_name { 'testvid.mp4' }
    attachment_content_type { 'video/mp4' }
    attachment_file_size { 5120 }
    attachment_meta { '{:length=>"0:00:09.30", :duration=>9.3, :fps=>29, :size=>"1280x720", :width=>1280, :height=>720, :aspect=>1.7777777777777777, :audio_encode=>"aac (LC) (mp4a / 0x6134706D)", :audio_bitrate=>"48000 Hz", :audio_channels=>"stereo"}' }
  end
end