module Haoshuju
  module Models
    class Weibo
      property name, content

      def initialize(@name : String, @content : String)
      end
    end

    class WeiboService
      def find_weibos_by_name(name)
        find_weibos.each.select { |x| x.name == name }
      end

      def find_weibos
        [Weibo.new("dengcaoyuan", "所谓实体关系的清晰脉络，就是要找到若干核心实体并围绕核心实体来构造关系，非核心实体之间的关联尽量通过核心实体来实现，避免随意的相关。这样的设计通常会导出若干聚集的实体团块，团块内部关系密切，团块之间关联简洁。这样设计的好处是既符合实体的现实关联方式，也利于在实现分布存贮时分割。"),
         Weibo.new("dengcaoyuan", "通常一个系统的架构至少要从实体关系层、业务逻辑层和表现层等层次考虑。万丈高楼从地起，实体关系层（或者说数据模型）永远是最重要的。对一个项目，我通常会首先花一两个月的时间对实体关系做仔细的分析和设计，而其要点是实体及关系的设计要用一条清晰、简洁的关系脉络将各实体间的关系表现出来。"),
         Weibo.new("xxx", "A new platform for fast data is emerging: #Akka, #Scala, @cassandra, @ApacheKafka, @ApacheSpark & @ApacheMesos. We're on to something big."),
         Weibo.new("cxr", "工作压力大的时候，可以去运动、按摩、听音乐。依然解不了的时候，可以请个长假，休息一段时间。依然解不了的时候，就把工作辞了，换个压力小一点的工作 ... 千万不要使用酒精或药物来麻痹自己，否则那可能会是一场悲剧的开始！"),
         Weibo.new("cxr", "当主管告诉你：「离开舒适的区域才能成长」 ... 多半他真正在乎的不是你的成长，而是说服你接下没人愿意做的棘手工作 [偷笑]"),
         Weibo.new("cxr", "刚刚听到一句话：依道不依势，依智不依力。[思考]"),
         Weibo.new("cxr", "许多人想通过各种现代化的工具来简化生活，于是他们使用各种最新设备，安装各种 app ... 殊不知简化生活靠的不是现代化工具，靠的是原始的大脑。"),
         Weibo.new("cxr", "没有运维知识的程序员不是好的架构师。"),
         Weibo.new("cxr", "身为一个心智正常的人，我不喜欢有人批评我，不喜欢遇到挫折，不喜欢丢脸，不喜欢成绩不好 ... 但每次事过境迁后回想，正是因为这些不好的事，才会促进成长与进步。"),
         Weibo.new("总裁精英", "职场中会遇到不同的上司，有对你有好感的，也有对你不好的。对待不同的上司，方式方法要不同。能成为其心腹的最佳方法就是投其所好，一定要言听计从，即使心中有不满的想法，也不要当众表达，要有忍耐之心，并进行换位思考。同时更要坚持自己内心的想法，做自己认为正确的事"),
         Weibo.new("cxr", "在重要与紧急的事情之间作选择，大多数的人一定只选紧急事项，结果就是一辈子被紧急事情追著跑，越来越累。有些人则是更关注重要事项，而放弃大部分的紧急事项，宁可让不致命的伤害发生，结果就是短时间内会有挫败，但体质越来越强，整体趋势往好的方向走。"),
         Weibo.new("cxr", "一直在做紧急的事，难得没有紧急的事时，你一定只想好好休息，没精力去做重要的事 ... 这导致：重.要.的.事.一.直.没.有.去.做.的.机.会."),
         Weibo.new("yuanyf", "前端技术栈（2015版）：React + Redux + ES6（Babel） + webpack + npm + jss + autoprefixer + eslint + Elemental UI + karma")].reverse
      end
    end
  end
end
