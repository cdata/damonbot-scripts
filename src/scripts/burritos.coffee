# Burritos - a Damonbot staple

module.exports = (robot) ->

  robot.hear /lunch\?/i, (msg) ->
    msg.send 'Burritos!'

  robot.hear /burritos\?/i, (msg) ->
    msg.send 'I love burritos!'

  robot.hear /tell.*me.*a.*joke\?/i, (msg) ->
    msg.send 'There were 4 Peanuts walking down the Straße. One was a assaulted... peanut.'

