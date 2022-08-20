# frozen_string_literal: true

class Transaction < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true

  def total_amount
    category.sum('amount')
  end
end
