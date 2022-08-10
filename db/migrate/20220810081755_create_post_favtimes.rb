class CreatePostFavtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_favtimes do |t|

      t.integer :costomer_id
      t.string :image
      t.string :title
      t.string :introduction

      t.timestamps
    end
  end
end
