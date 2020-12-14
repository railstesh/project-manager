class AddReferenceInAssign < ActiveRecord::Migration[5.2]
  def change
    add_reference :assigns, :user, index: true
    add_reference :assigns, :project, index: true
  end
end
