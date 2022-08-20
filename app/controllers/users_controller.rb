# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @user = current_user
  end
end
