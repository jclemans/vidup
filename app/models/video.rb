class Video < ActiveRecord::Base

  paginates_per 5

  has_attached_file :attachment, 
    styles: { medium: { :geometry => "640x480", :format => 'mp4' },
              thumb: { geometry: "100x100", :format => 'jpg' }
    }, 
    processors: [:transcoder]
  
  validates_attachment :attachment, presence: true,
    content_type: { content_type: "video/mp4" },
    size: { in: 0..50.megabytes }

  before_create :set_default_name
  
  def set_default_name
    self.title ||= File.basename(self.filename, '.*').titleize
  end
end
