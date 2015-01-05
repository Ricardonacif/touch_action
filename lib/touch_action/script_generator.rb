require 'erb'
require 'ostruct'

module TouchAction
  class ScriptGenerator
    ACTIONS_WITH_DEFAULT_OPTIONS = {
      tap: {},
      doubletap: {},
      flick: {axis: 'x', distance: 100,  duration: 500},
      pinch: {r1: 50, r2: 100},
      press: {hold: 2000},
      move: {path: {xdist: 70, ydist: -50},  duration: 500},
      rotate: {rotation: -75}
    }

    def self.generate_javascript action, options = {}
      action = :flick if action == :swipe
      raise ArgumentError, "The touch action #{action} doesn't exist" unless ACTIONS_WITH_DEFAULT_OPTIONS[action]
      script = File.read(File.expand_path("../javascripts/touch_action.js.erb", __FILE__))
      default_options = ACTIONS_WITH_DEFAULT_OPTIONS[action]
      arguments = {gesture: action.to_s, options: default_options.merge(options)}
      render_erb(script, arguments)
    end

  private

    def self.render_erb template, vars = {}
      ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
    end

  end
end