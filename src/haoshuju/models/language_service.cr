class Language
  property name, url, level, hots

  def initialize(@name : String, @url = [] of String, @level = 1 : Int32, @hots = 100 : Int32)
  end
end

class LanguageService
  def find_languages
    [Language.new("Scala", url = ["http://www.scala-lang.org", "http://scala-js.org/"]),
      Language.new("Ruby", url = ["http://www.ruby-lang.org", "http://www.jruby.org"]),
      Language.new("Rust", url = ["http://www.rust-lang.org"], level = 2),
      Language.new("Kotlin", url = ["http://kotlinlang.org"], 2),
      Language.new("TypeScript", url = ["http://www.typescriptlang.org/"], 2),
      Language.new("Swift", url = ["http://swift.org"], 4),
      Language.new("Crystal", url = ["http://www.crystal-lang.org"], level = 4),
      Language.new("Elixir", url = ["http://www.elixir-lang.org"], level = -2),
      Language.new("Go", url = ["http://www.golang.org"], level = 3),
      Language.new("Clojure", url = ["http://www.clojure.org"], level = -1)]
  end
end
