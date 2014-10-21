require 'spec_helper'

RSpec.describe TouchAction do
  describe "Flick" do
    it 'should flick the div bound by hammerJs' do
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'blue')
      div.touch_action :flick
      sleep(5)
      expect(@browser.p(id: 'direction').text).to include('swiped right')
    end

    it 'should flick the div bound by hammerJs when passing swipe instead of flick' do
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'blue')
      div.touch_action :swipe
      sleep(5)
      expect(@browser.p(id: 'direction').text).to include('swiped right')
    end

    context "Options" do
      it 'should flick the div bound by hammerJs 100px to the right as a default' do
        @browser.goto('http://localhost:9292')
        div = @browser.div(id: 'blue')
        div.touch_action :flick
        sleep(5)
        expect(@browser.p(id: 'direction').text).to include('swiped right')
        expect(@browser.p(id: 'duration').text).to include('100')
      end

      it 'should flick the div bound by hammerJs to the left when passing the a negative distance' do
        @browser.goto('http://localhost:9292')
        div = @browser.div(id: 'blue')
        div.touch_action :flick, distance: -80
        sleep(5)
        expect(@browser.p(id: 'direction').text).to include('swiped left')
        expect(@browser.p(id: 'duration').text).to include('80')
      end
    end
  end
end
