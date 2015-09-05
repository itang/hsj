module Haoshuju::Libs::Data
  enum Dir
    ASC
    DESC

    def asc?
      self == Dir::ASC
    end
  end

  class Sorter
    getter sort, dir

    def initialize(@sort="id" : String,
                   @dir=Dir::DESC : Dir)
    end
  end

  class Pager
    getter page, size, sorter

    def initialize(@page=1_u32 : UInt32,
                   @size=10_u32 : UInt32,
                   @sorter=Sorter.new : Sorter)
    end

    def starts
      (page - 1) * size
    end

    def ends
      starts + size - 1
    end
  end

  class Page(T)
    getter pager, total, items

    def initialize(@total : Int64,
                   @items : Array(T),
                   @pager : Pager)
    end
  end
end
