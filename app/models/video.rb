class Video < ActiveRecord::Base
  has_attached_file :attachment, 
    styles: { medium: { :geometry => "640x480", :format => 'mp4' },
              thumb: { geometry: "100x100#", :format => 'png', :time => 10 }
    }, 
    processors: [:transcoder]
  
  validates_attachment :attachment, presence: true,
    content_type: { content_type: "video/mp4" },
    size: { in: 0..20.megabytes }
end
