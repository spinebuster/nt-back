require "rails_helper"

RSpec.describe Products::PricesController, type: :routing do
  it "recognizes and generates a route for index" do
    expect(
      get: "/products/1/prices.json",
    ).to be_routable
  end

  it "recognizes and generates a route for create" do
    expect(
      post: "/products/1/prices.json",
    ).to be_routable
  end

  it "recognizes and generates a route for show" do
    expect(
      get: "/products/1/prices/2.json",
    ).to be_routable
  end

  it "recognizes and generates a route for update" do
    expect(
      put: "/products/1/prices/2.json",
    ).to be_routable
  end

  it "recognizes and generates a route for destroy" do
    expect(
      delete: "/products/1/prices/2.json",
    ).to be_routable
  end
end
