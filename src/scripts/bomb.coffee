module.exports = (robot) ->

    responses = [
        '$ANIMAL bombs are bad, and you are a bad person for wanting to do one.',
        'I hate you.',
        'Have you ever seen a actual $ANIMAL bomb? I have. You wouldn\'t think this was so funny if you had seen the real thing.',
        '$USER--'
    ]

    robot.respond /(pug|corgi).*bomb/i, (msg) ->

        msg.send ((msg.random responses).replace '$ANIMAL', msg.match[1]).replace '$USER', msg.message.user.name
