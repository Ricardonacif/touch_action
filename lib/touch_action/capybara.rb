require 'capybara'
require "touch_action/script_generator"

module TouchAction
  module Capybara
    def touch_action *args
      final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
      driver.browser.execute_script( final_script, self )
    end

  end

end

Capybara::Node::Element.class_eval { include TouchAction::Capybara }