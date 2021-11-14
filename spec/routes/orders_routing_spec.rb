require "rails_helper"

RSpec.describe OrdersController, type: :routing do
  it "recognizes and generates a route for index" do
    expect(
      get: "/orders.json",
    ).to be_routable
  end

  it "recognizes and generates a route for create" do
    expect(
      post: "/orders.json",
    ).to be_routable
  end

  it "recognizes and generates a route for show" do
    expect(
      get: "/orders/1.json",
    ).to be_routable
  end

  it "recognizes and generates a route for update" do
    expect(
      put: "/orders/1.json",
    ).to be_routable
  end

  it "recognizes and generates a route for destroy" do
    expect(
      delete: "/orders/1.json",
    ).to be_routable
  end
end
