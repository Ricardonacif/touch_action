require 'spec_helper'

RSpec.describe Capybara, type: :feature do

  it 'should have defined the method touch_action', js: true, use_webdriver: :capybara do
    visit('http://localhost:9292')
    expect(self).to respond_to :touch_action
  end

end