# frozen_string_literal: true

class SessionsController < Devise::SessionsController # rubocop:todo Style/Documentation
  def respond_to_on_destroy
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name), status: :see_other }
    end
  end
end
