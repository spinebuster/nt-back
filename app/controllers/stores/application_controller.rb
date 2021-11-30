module Stores
  class ApplicationController < ::ApplicationController
    protected

    def main_object
      Store.find(params[:store_id])
    end
  end
end
