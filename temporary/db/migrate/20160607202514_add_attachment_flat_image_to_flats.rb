class AddAttachmentFlatImageToFlats < ActiveRecord::Migration
  def self.up
    change_table :flats do |t|
      t.attachment :flat_image
    end
  end

  def self.down
    remove_attachment :flats, :flat_image
  end
end
