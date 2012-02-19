# Burritos - a Damonbot staple

module.exports = (robot) ->

  robot.hear /lunch\?/i, (msg) ->
    msg.send 'Burritos!'

  robot.hear /burritos\?/i, (msg) ->
    msg.send 'I love burritos!'
