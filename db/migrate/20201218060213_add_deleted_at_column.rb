# frozen_string_literal: true

# class
class AddDeletedAtColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :deleted_at, :datetime
    add_index :projects, :deleted_at
    add_column :assigns, :deleted_at, :datetime
    add_index :assigns, :deleted_at
    add_column :employees, :deleted_at, :datetime
    add_index :employees, :deleted_at
  end
end
