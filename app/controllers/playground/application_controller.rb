class Playground::ApplicationController < ApplicationController
  before_action :set_view_path
  layout 'application'



  private

    def set_view_path
      prepend_view_path Rails.root.join('app/views/playground')
    end
end
