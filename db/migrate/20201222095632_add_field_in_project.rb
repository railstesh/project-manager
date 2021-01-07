# frozen_string_literal: true

# class
class AddFieldInProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :technologies, :text, array: true, default: []
  end
end
