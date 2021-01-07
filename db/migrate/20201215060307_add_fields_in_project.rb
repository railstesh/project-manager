# frozen_string_literal: true

# class
class AddFieldsInProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :profile, :string
    add_column :projects, :work_limit, :integer
    add_column :projects, :technology, :string
    add_column :projects, :invoice_type, :integer, default: 0
    add_column :projects, :status, :integer, default: 0
    add_column :projects, :active_discription, :string
    add_column :projects, :inactive_discription, :string
  end
end
