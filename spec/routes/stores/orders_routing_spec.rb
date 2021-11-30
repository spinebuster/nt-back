require "rails_helper"

RSpec.describe Stores::OrdersController, type: :routing do
  it "recognizes and generates a route for index" do
    expect(
      get: "/stores/1/orders.json",
    ).to be_routable
  end

  it "recognizes and generates a route for create" do
    expect(
      post: "/stores/1/orders.json",
    ).to be_routable
  end

  it "recognizes and generates a route for show" do
    expect(
      get: "/stores/1/orders/1.json",
    ).to be_routable
  end

  it "recognizes and generates a route for update" do
    expect(
      put: "/stores/1/orders/1.json",
    ).to be_routable
  end

  it "recognizes and generates a route for destroy" do
    expect(
      delete: "/stores/1/orders/1.json",
    ).to be_routable
  end
end
