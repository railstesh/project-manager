class AddReferenceToAssign < ActiveRecord::Migration[5.2]
  def change
    add_reference :assigns, :employee, index: true
  end
end
