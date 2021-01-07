# frozen_string_literal: true

# class
class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :stack
      t.string :skills
      t.timestamps
    end
  end
end
