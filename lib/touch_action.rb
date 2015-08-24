require "touch_action/version"

if Gem::Specification::find_all_by_name('watir-webdriver').any?
  require 'touch_action/watir-webdriver'
end 

if Gem::Specification::find_all_by_name('selenium-webdriver').any?
  require 'touch_action/selenium-webdriver'
end

if Gem::Specification::find_all_by_name('capybara').any?
  require 'touch_action/capybara_rspec_helper'
  require 'touch_action/capybara_element'
end