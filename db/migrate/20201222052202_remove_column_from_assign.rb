# frozen_string_literal: true

# class
class RemoveColumnFromAssign < ActiveRecord::Migration[5.2]
  def change
    remove_column :assigns, :assigned
    remove_column :assigns, :status
    remove_column :assigns, :active_discription
    remove_column :assigns, :inactive_discription
  end
end
