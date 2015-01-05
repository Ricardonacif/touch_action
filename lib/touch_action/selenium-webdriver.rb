require 'selenium-webdriver'
require "touch_action/script_generator"

module TouchAction
  module SeleniumWebdriver

    def touch_action *args
      final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
      bridge.executeScript( final_script, self )
    end

  end
end

Selenium::WebDriver::Element.class_eval { include TouchAction::SeleniumWebdriver }