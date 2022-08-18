class CreateTagMiddles < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_middles do |t|
      t.references :post_favtime, foreign_key: true
      t.references :post_tag, foreign_key: true

      t.timestamps
    end
  end
end
