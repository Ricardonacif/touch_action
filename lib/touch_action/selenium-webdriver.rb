require 'selenium-webdriver'
require "touch_action/script_generator"

module TouchAction
  module SeleniumWebdriver

    def touch_action *args
      Selenium::WebDriver::Timeouts.new(bridge).script_timeout= 30
      bridge.executeAsyncScript( TouchAction::ScriptGenerator.yui_loader )
      final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
      bridge.executeAsyncScript( final_script, self )
    end

  end
end

Selenium::WebDriver::Element.class_eval { include TouchAction::SeleniumWebdriver }