require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Daizap
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.assets.precompile << 'admin/application.scss'
    config.assets.precompile << 'user/pc/application.scss'
    config.assets.precompile << 'user/sp/application.scss'
    config.assets.precompile << 'playground/application.scss'

    config.assets.precompile << 'admin/application.js'
    config.assets.precompile << 'user/pc/application.js'
    config.assets.precompile << 'user/sp/application.js'
    config.assets.precompile << 'playground/application.js'
    config.assets.precompile << 'react/application.js'

    config.assets.precompile += %w( *.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.jpeg *.gif)
  end
end
