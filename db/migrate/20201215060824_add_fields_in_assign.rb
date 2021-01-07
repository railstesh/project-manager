# frozen_string_literal: true

# class
class AddFieldsInAssign < ActiveRecord::Migration[5.2]
  def change
    add_column :assigns, :assigned_as, :integer, default: 0
    add_column :assigns, :status, :integer, default: 0
    add_column :assigns, :active_discription, :string
    add_column :assigns, :inactive_discription, :string
  end
end
