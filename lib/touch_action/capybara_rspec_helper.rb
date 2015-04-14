require 'capybara'
require "touch_action/script_generator"

module TouchAction
  module Capybara
    module RspecHelper

      def touch_action locator, *args
        final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
        page.driver.browser.execute_script( final_script, locator )
      end

    end
  end
end

RSpec.configure do |config|
  config.include TouchAction::Capybara::RspecHelper, :type => :feature
end if defined?(RSpec)
