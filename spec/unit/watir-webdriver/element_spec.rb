require 'spec_helper'

RSpec.describe Watir::Element do
  describe "Watir::Element instance" do
    it 'should respond to the method touch_action' do
      @browser.goto('http://localhost:9292')
      element = @browser.div(id: 'hit')
      expect(element).to respond_to(:touch_action)
    end
  end
end
