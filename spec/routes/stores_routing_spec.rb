require "rails_helper"

RSpec.describe StoresController, type: :routing do
  it "recognizes and generates a route for index" do
    expect(
      get: "/stores.json",
    ).to be_routable
  end

  it "recognizes and generates a route for create" do
    expect(
      post: "/stores.json",
    ).to be_routable
  end

  it "recognizes and generates a route for show" do
    expect(
      get: "/stores/2.json",
    ).to be_routable
  end

  it "recognizes and generates a route for update" do
    expect(
      put: "/stores/2.json",
    ).to be_routable
  end

  it "recognizes and generates a route for destroy" do
    expect(
      delete: "/stores/2.json",
    ).to be_routable
  end
end
