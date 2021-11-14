require "rspec/expectations"

RSpec::Matchers.define :be_json_success do |expected|
  match do |actual|
    json = JSON.parse(actual)
    expected == (json[:success] || json["success"])
  end
end
