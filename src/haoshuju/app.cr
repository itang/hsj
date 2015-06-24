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
      get "/hello", "welcome#hello"
      get "/test", "welcome#test"
      register WelcomeController
    end
  end
end
