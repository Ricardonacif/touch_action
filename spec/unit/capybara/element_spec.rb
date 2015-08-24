require 'spec_helper'

RSpec.describe TouchAction::CapybaraElement, type: :feature do
  it 'should respond to the method touch_action', js: true, use_webdriver: :capybara do
    visit('http://localhost:9292')
    element = find('#hit')
    expect(element).to respond_to(:touch_action)
    element.touch_action :move
    sleep(5)
    expect(find('#distance_x').text).to include('70')
    expect(find('#distance_y').text).to include('-50')
  end
end