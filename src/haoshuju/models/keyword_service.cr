class Keyword
  property name, content, hots
  def initialize(@name : String, @content : String, @hots : Int)
  end
end

class KeywordService
  def find_keywords_by_name(name)
    find_keywords.each.select { |x| x.name == name }.to_a
  end

  def find_keywords
    [Keyword.new("itang", "Scala", 100),
     Keyword.new("itang", "Akka", 99),
     Keyword.new("itang", "Kafka", 98),
     Keyword.new("itang", "Spark", 97),
     Keyword.new("itang", "Cassandra", 96),
     Keyword.new("itang", "Mesos", 95),
     Keyword.new("itang", "Docker", 94),
     Keyword.new("itang", "OpenStack", 95),
     Keyword.new("itang", "Hadoop", 94),
     Keyword.new("itang", "Crystal", 93)]
  end
end
