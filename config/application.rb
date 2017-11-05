require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Daizap
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.assets.precompile << 'admin/application.css'
    config.assets.precompile << 'user/application.css'
    config.assets.precompile << 'admin/application.js'
    config.assets.precompile << 'user/application.js'
    config.assets.precompile += %w( *.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.jpeg *.gif)
  end
end
