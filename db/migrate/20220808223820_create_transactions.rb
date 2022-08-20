# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
