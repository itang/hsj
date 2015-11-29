package hsj.counter

import scala.scalajs.js
import js.Dynamic.literal
import js.JSConverters._

import com.felstar.scalajs.vue.Vue
import com.felstar.scalajs.vue.VueArray

import org.scalajs.jquery.{ jQuery => $ }

@js.native
trait Result extends js.Object {
  var data: js.Array[String] = js.native
}

@js.native
trait CounterAppVue extends Vue {
  var dayItems: VueArray[DayItem] = js.native
}

@js.native
trait DayItem extends js.Object {
  var day: String = js.native
  var number: Int = js.native
  var maxed: Boolean = js.native
}

@js.native
object DayItem {
  def apply(day: String, number: Int, maxed: Boolean = false) =
    literal(day = day, number = number, maxed = maxed).asInstanceOf[DayItem]
}

object Main extends js.JSApp {
  override def main(): Unit = {
    val counterApp = new Vue(
      literal(el = "#counter-app",
        data = literal(dayItems = js.Array())
      )
    )
    val counterAppVue = counterApp.asInstanceOf[CounterAppVue]

    $.getJSON("/stat/counter/dailys", null, (x: Result) => {
      val cs = for (d :: n :: _more <- x.data.toList.grouped(2)) yield DayItem(d, n.toInt)
      val csl = cs.toList
      val max = csl.maxBy(_.number)
      val csw = csl.map(x => DayItem(x.day, x.number, x.day == max.day))
      println(csw)
      counterAppVue.dayItems = csw.toJSArray.asInstanceOf[VueArray[DayItem]]
    })

  }
}
