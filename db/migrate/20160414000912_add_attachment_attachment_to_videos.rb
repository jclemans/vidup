class AddAttachmentAttachmentToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :videos, :attachment
  end
end
