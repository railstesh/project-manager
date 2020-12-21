class AddReferenceToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :profile, index: true
    add_reference :projects, :technology, index: true
    remove_column :projects, :profile
    remove_column :projects, :technology
    remove_column :projects, :active_discription
    remove_column :projects, :inactive_discription
    remove_column :projects, :status
  end
end
