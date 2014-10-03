# TouchAction

Adds touch gestures to Watir and Selenium using YUI JS. Very useful when using Appium to test mobile websites. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'touch_action'
```

And then execute:

    $ bundle

## WARNING
It's currently being developed and there are no tests on it. For now, it's only supporting Watir-webdriver.

## Usage

```ruby
  #on the element you want to perform the action, call touch_action(:name_of_method)
  element = @driver.div(:id, 'hit')
  element.touch_action(:swipe)
```
###Available Gestures
It's currently supporting the gestures bellow. The hash as second argument is optional (here it's showing the default for each action).
```ruby
  element.touch_action(:flick, {axis: 'x', distance: -100,  duration: 50}) #flick and swipe are the same 
  
  element.touch_action(:pinch, {r1: 50, r2: 100})
  
  element.touch_action(:tap)
  
  element.touch_action(:doubletap)
  
  element.touch_action(:press,  {hold: 2000})
  
  element.touch_action(:move, {xdist: 70, ydist: -50,  duration: 2000})
  
  element.touch_action(:rotate, {rotation: -75})
  
```
For more information about how those methods work, please check the [YUI Documentation](http://yuilibrary.com/yui/docs/event/simulate.html#simulating-touch-gestures).


## Contributing

1. Fork it ( https://github.com/[my-github-username]/touch_action/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
