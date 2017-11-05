class User::ApplicationController < ApplicationController
  before_action :set_view_path
  layout 'application'



  private

    def set_view_path
      path = Rails.root.join('app/views/user')
      prepend_view_path(path)
    end
end
