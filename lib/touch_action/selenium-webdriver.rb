require 'selenium-webdriver'
require "touch_action/script_generator"

module TouchAction
  module SeleniumWebdriver

    def touch_action *args
      Selenium::WebDriver::Timeouts.new(bridge).script_timeout= 30
      bridge.executeAsyncScript( TouchAction::ScriptGenerator.yui_loader )
      final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
      bridge.executeAsyncScript( final_script, self )
      wait_for_page_ready_state      
    end

  private

    def wait_for_page_ready_state
      sleep(0.5) # mobile browsers wait around 300ms when tapping to check if it isn's a double tap before triggering the link
      end_time = Time.now + 30
      while (bridge.executeScript('return document.readyState' != 'complete') || Time.now > end_time)
        sleep(0.1)
      end
    end

  end
end

Selenium::WebDriver::Element.class_eval { include TouchAction::SeleniumWebdriver }