require_relative './controller_marcos.rb'
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMarcos, type: :controller
end
