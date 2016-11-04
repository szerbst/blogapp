class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.belongs_to :commentable, polymorphic: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]

  end
end
