require 'capybara'
require "touch_action/script_generator"

module TouchAction
  module Capybara
    module RspecHelper

      def touch_action locator, *args
        page.driver.browser.manage.timeouts.script_timeout = 30
        page.driver.browser.execute_async_script( TouchAction::ScriptGenerator.yui_loader )
        final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
        page.driver.browser.execute_async_script( final_script, locator )
      end

    end
  end
end

RSpec.configure do |config|
  config.include TouchAction::Capybara::RspecHelper, :type => :feature
end