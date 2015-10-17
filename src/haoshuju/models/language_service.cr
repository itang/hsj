class Language
  property name, url, hots

  def initialize(@name : String, @url = "" : String, @hots = 100 : Int32)
  end
end

class LanguageService
  def find_languages
    [Language.new("Scala", url = "http://www.scala-lang.org"),
     Language.new("Ruby", url = "http://www.ruby-lang.org"),
     Language.new("Elixir", url = "http://www.elixir-lang.org"),
     Language.new("Scala.js", url = "http://scala-js.org/"),
     Language.new("Rust", url = "http://www.rust-lang.org"),
     Language.new("Crystal", url = "http://www.crystal-lang.org")]
  end
end
