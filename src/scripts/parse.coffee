jsdom = require "jsdom"
vm = require "vm"

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

    try
      response = vm.runInNewContext evalable
    catch e
      response = e.message

    msg.send response
