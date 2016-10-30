class CreateImages < ActiveRecord::Migration[5.0]
  def change
  	drop_table :images
    create_table :images do |t|
      t.text :caption
      t.belongs_to :imageable, polymorphic: true

      t.timestamps
    end
    add_index :images, [:imageable_id, :imageable_type]
  end
end
