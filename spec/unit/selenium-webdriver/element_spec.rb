require 'spec_helper'

RSpec.describe Selenium::WebDriver::Element do
  describe "Selenium::WebDriver instance" do
    it 'should respond to the method touch_action', use_webdriver: :selenium do
      @browser.navigate.to('http://localhost:9292')
      element = @browser.find_element(:id, 'hit')
      expect(element).to respond_to(:touch_action)
    end
  end
end
