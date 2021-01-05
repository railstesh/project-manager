class AddColumnInProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :tracker, :boolean
  end
end
