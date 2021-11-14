Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :orders,   only: %i[index create show update destroy]

  resources :products, only: %i[index create show update destroy] do
    resources(
      :discounts,
      only: %i[index create show update destroy],
      controller: "products/discounts",
    )

    resources(
      :prices,
      only: %i[index create show update destroy],
      controller: "products/prices",
    )
  end

  root to: "products#index", defaults: { format: "json" }
end
