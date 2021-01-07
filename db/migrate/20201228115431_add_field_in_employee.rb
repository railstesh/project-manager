# frozen_string_literal: true

# class
class AddFieldInEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :status, :integer, default: 0
    remove_column :employees, :skills
    add_column :employees, :skills, :text, array: true, default: []
  end
end
