jsdom = require "jsdom"
path = require "path"
child = require "child_process"

module.exports = (robot) ->
  
  robot.respond /parse(?: me)? (.*)/i, (msg) ->

    parseable = msg.match[1]

    if parseable

      jsdom.env "<div id='container'></div>", (error, window) ->

        if window

          div = window.document.getElementById 'container'

          try
            div.innerHTML = parseable
            response = div.innerHTML
          catch e
            response = e.message

          msg.send response

  robot.respond /eval(?: me)? (.*)/i, (msg) ->

    evalable = msg.match[1]

    originalExecPath = process.execPath

    # EPIC HACK WHAT! (fuck CoffeeScript)
    process.execPath = "/home/chris/local/bin/node"

    runner = child.fork path.join __dirname, "../eval-helper.js"

    process.execPath = originalExecPath
    runner.on 'message', (response) ->
      msg.send response.result
      clearTimeout runTimer

    runner.send { evalable: evalable }

    runTimer = setTimeout (->
      runner.kill 'SIGKILL'
      msg.send "Ptooey. That's all I have to say about your pitiful long-running script. Try again :P"
    ), 3000

