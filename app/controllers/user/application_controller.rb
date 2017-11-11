class User::ApplicationController < ApplicationController
  before_action :set_view_path
  layout 'application'



  private

    def set_view_path
      devise = request.smart_phone? ? 'sp' : 'pc'
      prepend_view_path Rails.root.join('app/views/user').join(devise)
    end
end
