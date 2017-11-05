class Admin::ApplicationController < ApplicationController
  before_action :set_view_path
  layout 'application'



  private

    def set_view_path
      path = Rails.root.join('app/views/admin')
      prepend_view_path(path)
    end
end
