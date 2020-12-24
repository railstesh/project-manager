class AddReferenceToCrediential < ActiveRecord::Migration[5.2]
  def change
    add_reference :credientials, :project, index: true
    add_reference :credientials, :crediential_type, index: true
  end
end
