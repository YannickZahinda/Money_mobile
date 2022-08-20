# frozen_string_literal: true

class UnlocksController < ApplicationController # rubocop:todo Style/Documentation
  def index
    redirect_to users_path if user_signed_in?
  end
end
