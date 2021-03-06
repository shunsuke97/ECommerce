require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

# .envを読み込み
Dotenv::Railtie.load

module ECommerce
  class Application < Rails::Application
    # rails gコマンド使用時に不要ファイルを生成しない
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    # タイムゾーンを東京に設定
    config.time_zone = "Tokyo"
    config.load_defaults 5.2
    config.generators.system_tests = nil
  end
end
