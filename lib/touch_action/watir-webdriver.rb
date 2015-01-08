require 'watir-webdriver'
require "touch_action/script_generator"

module TouchAction
  module WatirWebdriver

    def touch_action *args
      browser.driver.manage.timeouts.script_timeout = 30
      browser.driver.execute_async_script( TouchAction::ScriptGenerator.yui_loader )
      final_script = TouchAction::ScriptGenerator.generate_javascript(*args)
      browser.driver.execute_async_script( final_script, self.wd  )
      wait_for_page_ready_state
    end


  private

    def wait_for_page_ready_state
      sleep(0.5) # mobile browsers wait around 300ms when tapping to check if it isn's a double tap before triggering the link
      browser.wait(60)
    end
  end

end

Watir::Element.class_eval { include TouchAction::WatirWebdriver }