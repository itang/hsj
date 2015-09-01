##
# App.
##
require "amethyst"
require "./controllers"

include Haoshuju::Controllers

module Haoshuju
  class HaoshujuApp < Base::App
    routes.draw do
      all "/",          "welcome#index"
      get "/dicts",     "dict#index"
      get "/_migrate",  "tool#migrate!"
      get "/ping",      "tool#ping"
      get "/test/timeout", "tool#timeout"
      get "/langs_sheet", "langs#sheet"
      get "/tool/querystring", "tool#querystring"

      post "/api/dict",     "dict#add_dict!"

      register WelcomeController
      register DictController
      register ToolController
      register LangsController
    end
  end
end
