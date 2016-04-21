class AddAttachmentMetaToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :attachment_meta, :string
  end
end
