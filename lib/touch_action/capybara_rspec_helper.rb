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
        wait_for_page_ready_state
      end

    private
      def wait_for_page_ready_state
        sleep(0.5) # mobile browsers wait around 300ms when tapping to check if it isn's a double tap before triggering the link
        end_time = Time.now + 30
        while (page.driver.browser.execute_script('return document.readyState' != 'complete') || Time.now > end_time)
          sleep(0.1)
        end
      end

    end
  end
end

RSpec.configure do |config|
  config.include TouchAction::Capybara::RspecHelper, :type => :feature
end