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
    flick: {axis: 'x', distance: 100,  duration: 50},
    pinch: {r1: 50, r2: 100},
    press: {hold: 2000},
    move: {xdist: 70, ydist: -50,  duration: 500},
    rotate: {rotation: -75}
  }

  def touch_action action, options = {}
    action = :flick if action == :swipe
    raise ArgumentError, "The touch action #{action} doesn't exist" unless ACTIONS_WITH_DEFAULT_OPTIONS[action]
    default_options = ACTIONS_WITH_DEFAULT_OPTIONS[action]
    options = default_options.merge options
    script = File.read(File.expand_path("../touch_action/javascripts/#{action.to_s}.js.erb", __FILE__))
    final_script = render_erb(script, options)
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




