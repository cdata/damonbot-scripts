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
