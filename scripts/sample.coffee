child_process = require 'child_process'

module.exports = (robot) ->
  # メッセージ送信
  robot.hear /疲れた/i, (msg) ->
    msg.send  "頑張って！"

  # 画像送信
  robot.hear /娘/i, (msg) ->
    filename = 'images/daughter.jpg'
    channel = msg.message.rawMessage.channel
    child_process.exec "curl -F file=@#{filename} -F channels=#{channel} -F token=#{process.env.HUBOT_SLACK_TOKEN} https://slack.com/api/files.upload"
