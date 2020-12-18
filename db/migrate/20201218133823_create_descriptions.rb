class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.string :title
      t.integer :descriptable_id
      t.string :descriptable_type

      t.timestamps
    end
  end
end
