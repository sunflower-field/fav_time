class CreatePostFavtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_favtimes do |t|

      t.integer :user_id
      t.string :image
      t.string :title
      t.string :introduction
      t.integer :post_tag_id

      t.timestamps
    end
  end
end
