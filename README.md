# TouchAction
[![Build Status](https://travis-ci.org/Ricardonacif/touch_action.svg?branch=master)](https://travis-ci.org/Ricardonacif/touch_action)
[![Code Climate](https://codeclimate.com/github/Ricardonacif/touch_action/badges/gpa.svg)](https://codeclimate.com/github/Ricardonacif/touch_action)

Touch Action is a Ruby Gem used to add touch gestures simulation to the Watir-WebDriver and Selenium-WebDriver in order to perform automated tests on mobile websites that requires those type of actions. It encapsulates the touch action library of [YUI JS](http://yuilibrary.com/yui/docs/event/simulate.html#simulating-touch-gestures). Very useful for example when testing mobile websites using [Appium](http://appium.io).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'touch_action'
```

And then execute:

    $ bundle

And then add `require 'touch_action'` to your spec_helper.rb or wherever you want to use it.

## Usage

```ruby
  #on the element you want to perform the action, call touch_action(:name_of_action)
  element = @driver.div(:id, 'hit')
  element.touch_action(:swipe)
```
###Available Gestures

It's currently supporting the gestures bellow. The only required argument is the action symbol, the rest are optional (here it's showing the default options for each action).

```ruby
  element.touch_action(:flick, axis: 'x', distance: 100,  duration: 50) #flick and swipe are the same 
  
  element.touch_action(:pinch, r1: 50, r2: 100)
  
  element.touch_action(:tap)
  
  element.touch_action(:doubletap)
  
  element.touch_action(:press,  hold: 2000)
  
  element.touch_action(:move, xdist: 70, ydist: -50,  duration: 500)
  
  element.touch_action(:rotate, {rotation: -75})
  
```
For more information about how those methods work, please check the [YUI Documentation](http://yuilibrary.com/yui/docs/event/simulate.html#simulating-touch-gestures).


## Contributing

1. Fork it ( https://github.com/[my-github-username]/touch_action/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request