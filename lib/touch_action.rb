require 'erb'
require 'ostruct'
require "touch_action/version"

if Gem::Specification::find_all_by_name('watir-webdriver').any?
  require 'watir-webdriver'
elsif Gem::Specification::find_all_by_name('selenium-webdriver').any?
  require 'selenium-webdriver'
end


module TouchAction

  ACTIONS_WITH_DEFAULT_OPTIONS = {
    tap: {},
    doubletap: {},
    flick: {axis: 'x', distance: 100,  duration: 500},
    pinch: {r1: 50, r2: 100},
    press: {hold: 2000},
    move: {path: {xdist: 70, ydist: -50},  duration: 500},
    rotate: {rotation: -75}
  }

  def touch_action action, options = {}
    action = :flick if action == :swipe
    raise ArgumentError, "The touch action #{action} doesn't exist" unless ACTIONS_WITH_DEFAULT_OPTIONS[action]
    script = File.read(File.expand_path("../touch_action/javascripts/touch_action.js.erb", __FILE__))    
    default_options = ACTIONS_WITH_DEFAULT_OPTIONS[action]
    arguments = {gesture: action.to_s, options: default_options.merge(options)}
    final_script = render_erb(script, arguments)
    if self.class == Selenium::WebDriver::Element
      bridge.executeScript( final_script, self )
    else
      browser.execute_script( final_script, self )
    end
  end

private

  def render_erb template, vars = {}
    ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
  end

end

if Gem::Specification::find_all_by_name('watir-webdriver').any?
  Watir::Element.class_eval { include TouchAction }
elsif Gem::Specification::find_all_by_name('selenium-webdriver').any?
  Selenium::WebDriver::Element.class_eval { include TouchAction }
end




