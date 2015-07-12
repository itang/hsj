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
      get "/dict", "dict#index"
      post "/dict", "dict#add_dict!"

      get "/_migrate", "tool#migrate!"

      register WelcomeController
      register DictController
      register ToolController
    end
  end
end
