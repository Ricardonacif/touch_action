require 'spec_helper'

RSpec.describe Capybara::Node::Element do
  describe "Capybara::Node::Element instance", type: :feature do
    it 'should respond to the method touch_action', js: true, use_webdriver: :capybara do
      visit('http://localhost:9292')
      element = find('#hit')
      expect(element).to respond_to(:touch_action)
    end
  end
end