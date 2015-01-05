require 'capybara'
require "touch_action/script_generator"

module TouchAction
  module Capybara
    module RspecHelper

      def touch_action locator, *args
        find(locator).touch_action *args
      end

    end
  end
end

RSpec.configure do |config|
  config.include TouchAction::Capybara::RspecHelper, :type => :feature
end