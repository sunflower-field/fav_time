class CreateTagMiddles < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_middles do |t|

      t.integer :tag

      t.timestamps
    end
  end
end
