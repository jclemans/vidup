class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :length
      t.string :format

      t.timestamps null: false
    end
  end
end
