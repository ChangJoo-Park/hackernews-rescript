let nowMillisecond = (): float => Js.Date.now()

let redableMillisecond = (ms: int): (string, string) => {
  let pluralize = (number: int) => number > 1 ? "s" : ""
  let oneMinute = 60000
  let oneHour = 3600000
  let oneDay = oneHour * 24
  if ms < oneHour {
    let minute = ms / oneMinute
    (minute->Belt.Int.toString, `minute${pluralize(minute)}`)
  } else if ms > oneDay {
    let day = ms / oneDay
    (day->Belt.Int.toString, `day${pluralize(day)}`)
  } else {
    let hour = ms / oneHour
    (hour->Belt.Int.toString, `hour${pluralize(hour)}`)
  }
}

let fromNow = (datetimeString: string) => {
  let datetime = datetimeString->Js.Date.fromString
  let ms = datetime->Js.Date.getTime
  let diff = nowMillisecond()->Belt.Float.toInt - ms->Belt.Float.toInt
  let postfix = "ago"
  let (amount, unit) = diff->Js.Math.abs_int->redableMillisecond
  `${amount} ${unit} ${postfix}`
}
