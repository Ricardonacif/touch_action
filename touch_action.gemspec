# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'touch_action/version'

Gem::Specification.new do |spec|
  spec.name          = "touch_action"
  spec.version       = TouchAction::VERSION
  spec.authors       = ["Ricardo Nacif"]
  spec.email         = ["nacif.ricardo@gmail.com"]
  spec.summary       = "Adds touch gestures simulation to Watir-WebDriver, Selenium-WebDriver and Capybara using YUI JS."
  spec.description   = "Adds touch gestures simulation to Watir, Selenium and Capybara using YUI JS."
  spec.homepage      = "https://github.com/Ricardonacif/touch_action"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "watir-webdriver"
  spec.add_development_dependency "capybara"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rack"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "thin"

end