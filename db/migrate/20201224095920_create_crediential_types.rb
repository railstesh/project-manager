# frozen_string_literal: true

# class
class CreateCredientialTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :crediential_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
