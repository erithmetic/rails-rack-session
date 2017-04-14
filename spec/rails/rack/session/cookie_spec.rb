require "spec_helper"

describe Rails::Rack::Session::Cookie do
  it "has a version number" do
    expect(Rails::Rack::Session::Cookie::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
