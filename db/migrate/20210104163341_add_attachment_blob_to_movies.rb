class AddAttachmentBlobToMovies < ActiveRecord::Migration[6.0]
  def self.up
    change_table :movies do |t|
      t.attachment :blob
    end
  end

  def self.down
    remove_attachment :movies, :blob
  end
end
