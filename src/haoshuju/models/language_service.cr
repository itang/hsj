class Language
  property name, url, level, hots

  def initialize(@name : String, @url = [] of String, @level = 1 : Int32, @hots = 100 : Int32)
  end
end

class LanguageService
  def find_languages
    [Language.new("Scala", url = ["http://www.scala-lang.org", "http://scala-js.org/"]),
      Language.new("Ruby", url = ["http://www.ruby-lang.org", "http://www.jruby.org"]),
      Language.new("Elixir", url = ["http://www.elixir-lang.org"], level = 2),
      Language.new("Rust", url = ["http://www.rust-lang.org"]),
      Language.new("Crystal", url = ["http://www.crystal-lang.org"], level = 2),
      Language.new("Go", url = ["http://www.golang.org"], level = -1),
      Language.new("Clojure", url = ["http://www.clojure.org"], level = -1)]
  end
end
