# Monit Slack

Provide a simple TCP Check with Monit and Slack Notifier.

**Note**
You can change the payload in `slack_notifications*.sh` if you want a more customized slack message.

## Support

Contact us on [Discord](https://discordapp.com/invite/jqDHRxD)

## Environment Variables

| Env Var        | Description                               | Default      |
|----------------|-------------------------------------------|--------------|
| SLACK_WEBHOOK  | Slack Webhook URL                         |              |
| SLACK_CHANNEL  | Slack Channel where Monit send messages   | monitoring   |
| SLACK_USERNAME | Slack Username Monit use                  | Monit        |
| SLACK_PRETEXT  | Slack Pretext Message                     | Dev          |
| INTERVAL       | Check Interval (in seconds)               | 10           |
| ADRESSES       | List of address:port separated with `,`   | localhost:80 |
| PORT           | Port monit listen to for the UI           | 80           |
| LOGIN          | Login to connect to the UI `username:pwd` | admin:monit  |

# Deploy on KintoHub

Waiting for Catalog...
