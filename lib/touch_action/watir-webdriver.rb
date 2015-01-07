require 'watir-webdriver'
require "touch_action/script_generator"

module TouchAction
  module WatirWebdriver

    def touch_action *args
      browser.driver.manage.timeouts.script_timeout = 30
      browser.driver.execute_async_script( TouchAction::ScriptGenerator.yui_loader )
      final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
      browser.driver.execute_async_script( final_script, self.wd  )
    end
  end

end

Watir::Element.class_eval { include TouchAction::WatirWebdriver }