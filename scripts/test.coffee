module.exports = (robot) ->
  robot.hear /hoge/i, (msg) ->
    msg.send 'piyo'