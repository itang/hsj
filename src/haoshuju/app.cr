##
# App.
##
require "amethyst"
require "./controllers"

include Haoshuju::Controllers

module Haoshuju
  class HaoshujuApp < Base::App
    routes.draw do
      all "/",      "welcome#index"
      post "/dict", "welcome#add_dict!"
      get "/_migrate", "welcome#migrate"

      get "/test", "dict#add_dict!"

      register WelcomeController
      #register TestController
    end
  end
end
