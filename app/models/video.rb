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

  def set_defaults
    if self.attachment
      metadata = eval(self.attachment_meta)
      file_name_details = self.attachment_file_name.split('.')
      self.title ||= file_name_details.first.titleize
      self.format = file_name_details.last.titleize
      self.length = metadata[:duration].round
    end
  end

end
