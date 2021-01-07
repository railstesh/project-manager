# frozen_string_literal: true

# class
class CreateAssigns < ActiveRecord::Migration[5.2]
  def change
    create_table :assigns do |t|
      t.string :assigned
      t.integer :billing_hours
      t.timestamps
    end
  end
end
