# frozen_string_literal: true

class TransactionsController < ApplicationController # rubocop:todo Style/Documentation
  def new
    @transaction = Transaction.new
    @category = Category.where(author_id: current_user.id)
  end

  def create
    transaction = Transaction.new(transaction_params)

    if transaction.save # rubocop:todo Style/GuardClause
      redirect_to category_url(transaction.category), notice: 'Transaction was successfully created.'
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])

    if transaction.destroy!
      redirect_to categories_url, notice: 'Transaction was successfully deleted.'
    else
      redirect_to categories_url, notice: 'Faile to delete transaction.'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def transaction_params
    transaction = params.require(:transaction).permit(:name, :amount, :category_id)
    transaction[:user_id] = current_user.id
    transaction
  end
end
