let nowMillisecond = (): float => Js.Date.now()

let redableMillisecond = (ms: int): (string, string) => {
  let oneMinute = 60000
  let oneHour = 3600000
  let oneDay = oneHour * 24
  if ms < oneHour {
    let minute = ms / oneMinute
    let postfix = minute > 1 ? "s" : ""
    (minute->Belt.Int.toString, `minute${postfix}`)
  } else if ms > oneDay {
    let day = ms / oneDay
    let postfix = day > 1 ? "s" : ""
    (day->Belt.Int.toString, `day${postfix}`)
  } else {
    let hour = ms / oneHour
    let postfix = hour > 1 ? "s" : ""
    (hour->Belt.Int.toString, `hour${postfix}`)
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
