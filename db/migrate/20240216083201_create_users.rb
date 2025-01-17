# frozen_string_literal: true

# Migration to create User table
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :phone, null: false, default: ''

      t.timestamps
    end
  end
end
