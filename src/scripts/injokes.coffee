piratologieGagEnabled = false

remindAboutPiratologie = (msg) ->
  msg.send "piratologie.org would like to be enabled."

module.exports = (robot) ->

  robot.hear /piratologie.*disabled/i, (msg) ->
    unless piratologieGagEnabled
      piratologieGagEnabled = true

      (->
        remindAboutPiratologie msg

        setTimeout arguments.callee, 86400000 + (Math.random * 172800000)
      )()

  robot.hear /\(╯‵Д′\)╯彡┻━┻/i, (msg) ->

    msg.send "┬──┬ ノ( ゜-゜ノ)"

  robot.hear /arise.*chicken/i, (msg) ->

    msg.send "Arise!"
