class Video < ActiveRecord::Base
  has_attached_file :attachment, 
    styles: { medium: "300x300>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment :attachment, presence: true,
    content_type: { content_type: "video/mp4" },
    size: { in: 0..10.kilobytes }
end
