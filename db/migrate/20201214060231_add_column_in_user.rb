# frozen_string_literal: true

# class
class AddColumnInUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, default: 0
    add_column :users, :name, :string
  end
end
