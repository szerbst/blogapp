class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :favorable, polymorphic: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :favorites, [:favorable_id, :favorable_type]
  end
end