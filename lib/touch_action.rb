require 'erb'
require 'ostruct'
require "touch_action/version"
require 'watir-webdriver'

module TouchAction

  def touch_action action, options = {}
    browser.execute_script( send(action.to_s + '_script', options), self )
  end

  def flick_script options = {}
    default_options = {axis: 'x', distance: -100,  duration: 50}
    default_options.merge! options
    flick = File.read(File.expand_path("../touch_action/javascripts/flick.js.erb", __FILE__))
    render_erb(flick, default_options)
  end

  def pinch_script options = {}
    default_options = {r1: 50, r2: 100}
    default_options.merge! options
    pinch = File.read(File.expand_path("../touch_action/javascripts/pinch.js.erb", __FILE__))
    render_erb(pinch, default_options)
  end

  def tap_script options = {}
    tap = File.read(File.expand_path("../touch_action/javascripts/tap.js.erb", __FILE__))
    render_erb tap
  end

  def doubletap_script options = {}
    doubletap = File.read(File.expand_path("../touch_action/javascripts/doubletap.js.erb", __FILE__))
    render_erb doubletap
  end

  def press_script options = {}
    default_options = {hold: 2000}
    default_options.merge! options
    press = File.read(File.expand_path("../touch_action/javascripts/press.js.erb", __FILE__))
    render_erb(press, default_options)
  end

  def move_script options = {}
    default_options = {xdist: 70, ydist: -50,  duration: 2000}
    default_options.merge! options
    move = File.read(File.expand_path("../touch_action/javascripts/move.js.erb", __FILE__))
    render_erb(move, default_options)
  end

  def rotate_script options = {}
    default_options = {rotation: -75}
    default_options.merge! options
    rotate = File.read(File.expand_path("../touch_action/javascripts/rotate.js.erb", __FILE__))
    render_erb(rotate, default_options)
  end

  alias_method :swipe_script, :flick_script

private

  def render_erb template, vars = {}
    ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
  end

end

Watir::Element.class_eval { include TouchAction }