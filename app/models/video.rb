class Video < ActiveRecord::Base

  paginates_per 5

  has_attached_file :attachment, 
    styles: { medium: { :geometry => "640x480", :format => 'mp4' },
              thumb: { geometry: "150x100", :format => 'jpg' }
    }, 
    processors: [:transcoder]
  
  validates_attachment :attachment, presence: true,
    content_type: { content_type: "video/mp4" },
    size: { in: 0..50.megabytes }
  validates :title, presence: true

  before_save :set_defaults
  after_create :set_duration


  def set_defaults
    if self.attachment
      file_name_details = self.attachment_file_name.split('.')
      self.title ||= file_name_details.first.titleize
      self.format = file_name_details.last.titleize
    end
  end

  def set_duration
    if Rails.env == 'test'
      file_path = Rails.root.join("spec/sample_files/videos/#{self.attachment_file_name}")
    else
      file_path = Rails.root.join("public/system/videos/attachments/000/000/#{self.id}/original/#{self.attachment_file_name}")
    end
    duration = `ffprobe -i #{file_path} -show_entries format=duration -v quiet -of csv="p=0"`
    self.length = duration.to_f
    self.save
  end

end
