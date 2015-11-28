# #
# App.
# #
require "amethyst"
require "./controllers"

module Haoshuju
  class HaoshujuApp < Base::App
    routes.draw do
      all "/", "welcome#index"
      get "/dicts", "dict#index"
      get "/reads", "read#index"
      get "/_migrate", "tool#migrate!"
      get "/ping", "tool#ping"
      get "/test/timeout", "tool#timeout"
      get "/langs_sheet", "langs#sheet"
      get "/tool/querystring", "tool#querystring"

      post "/api/dict", "dict#add_dict!"

      get "/stat/counter/dailys", "counter#daily"
      get "/stat", "counter#index"

      register WelcomeController
      register DictController
      register ReadController
      register ToolController
      register LangsController
      register CounterController
    end
  end
end
