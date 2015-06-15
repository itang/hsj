module Haoshuju
  module Models
    class Weibo
      property name, content
      def initialize(@name : String, @content : String)
      end
    end

    class WeiboService
      def find_weibos_by_name(name)
        find_weibos.each.select { |x| x.name == name }.to_a
      end

      def find_weibos
        [Weibo.new("xxx", "A new platform for fast data is emerging: #Akka, #Scala, @cassandra, @ApacheKafka, @ApacheSpark & @ApacheMesos. We're on to something big."),
        Weibo.new("cxr", "工作压力大的时候，可以去运动、按摩、听音乐。依然解不了的时候，可以请个长假，休息一段时间。依然解不了的时候，就把工作辞了，换个压力小一点的工作 ... 千万不要使用酒精或药物来麻痹自己，否则那可能会是一场悲剧的开始！"),
        Weibo.new("cxr", "当主管告诉你：「离开舒适的区域才能成长」 ... 多半他真正在乎的不是你的成长，而是说服你接下没人愿意做的棘手工作 [偷笑]"),
        Weibo.new("cxr", "刚刚听到一句话：依道不依势，依智不依力。[思考]"),
        Weibo.new("cxr", "许多人想通过各种现代化的工具来简化生活，于是他们使用各种最新设备，安装各种 app ... 殊不知简化生活靠的不是现代化工具，靠的是原始的大脑。"),
        Weibo.new("cxr", "没有运维知识的程序员不是好的架构师。"),
        Weibo.new("cxr", "身为一个心智正常的人，我不喜欢有人批评我，不喜欢遇到挫折，不喜欢丢脸，不喜欢成绩不好 ... 但每次事过境迁后回想，正是因为这些不好的事，才会促进成长与进步。"),
        Weibo.new("itang", "Hehe")]
      end
    end
  end

end
