# frozen_string_literal: true

class CategoriesController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @transactions = @category.transactions.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)

    if category.save
      redirect_to categories_url, notice: 'Your category is succesfully created.'
    else
      redirect_to categories_path, alert: 'Failed to create new category'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy!
      flash[:notice] = 'Deleted category successfully!'
      redirect_to categories_path
    else
      flash[:alert] = 'Failed to delete category!'
    end
  end

  private

  def category_params
    category = params.require(:category).permit(:name, :icon, :user_id)
    category[:user_id] = current_user.id
    category
  end
end
