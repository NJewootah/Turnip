require 'rspec'
require 'watir'
require 'pry'

Dir.glob("spec/features/support/**/generic.rb") { |f| load f}
Dir.glob("spec/features/support/**/*.rb") { |f| load f}

Dir.glob("spec/lib/**/*.rb") { |f| load f}
Dir.glob("spec/**/*steps.rb") { |f| load f}

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
