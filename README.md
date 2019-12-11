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

## KintoBlock

Click **KintoBlocks** on the left menu.

### Lighthouse

1. Click **Create KintoBlock**
2. Choose [Website Block](https://docs.kintohub.com/docs/kintoblocks/websites)
3. Choose the repo you forked previously
4. Set the **Source Folder Path** to `/lighthouse` and click **Continue**
5. Set the **Name** (`lighthouse`?) and don't change the **Internal Name**
6. Choose **DynamicWeb app**
7. Choose `Node.js` as the **language** and `stretch` as the **version**
8. Set the **Build Command** as `npm install`
9. Set the **Start Command** as `npm start`
10. Set the **Port** as `3000` and click **Create Website**
11. Choose `KINTO` **Branch** on the left side and click **Build Latest Commit** (top right)
While your block is building
12. Click **SETTINGS** (top left)
13. Add **Environment Variable** `HOST`, enable **Required** and click **+**
14. Add **Environment Variable** `CRON`, enable **Required** and click **+**
15. Add **Environment Variable** `URLS`, enable **Required** and click **+**
16. Click **Save** (top right)

Wait for your build to be successful (green).

**Note**
Since there is a Dockerfile in the folder `/lighthouse`, it will be used by default so step `7` to `9` are useless. This will be replace with language `Dockerfile` in the future.

### Grafana

1. Click **Create KintoBlock**
2. Choose [Website Block](https://docs.kintohub.com/docs/kintoblocks/websites)
3. Choose the repo you forked previously
4. Set the **Source Folder Path** to `/grafana` and click **Continue**
5. Set the **Name** (`grafana-webperf`?) and don't change the **Internal Name**
6. Choose **DynamicWeb app**
7. Choose `Node.js` as the **language** and `stretch` as the **version**
8. Set the **Build Command** as `npm install`
9. Set the **Start Command** as `npm start`
10. Set the **Port** as `3000` and click **Create Website**
11. Choose `KINTO` **Branch** on the left side and click **Build Latest Commit** (top right)
While your block is building
12. Click **SETTINGS** (top left)
13. Add **Environment Variable** `GF_SECURITY_ADMIN_PASSWORD`, enable **Required** and click **+**
14. Add **Environment Variable** `GF_PANELS_DISABLE_SANITIZE_HTML`, set it to `true`, enable **Required** and click **+**
15. Add **Environment Variable** `INFLUX_URL`, enable **Required** and click **+**
16. Click **Save** (top right)

Wait for your build to be successful (green).

**Note**
Since there is a Dockerfile in the folder `/grafana`, it will be used by default so step `7` to `9` are useless. This will be replace with language `Dockerfile` in the future.

## Projects

Click **Projects** on the left menu.

### Deploy InfluxDB

1. Click **Create Project**
2. Set the **Project Name** and don't change the **Internal Name**
3. Click **Add KintoBlocks...** searchbar, type `influxdb` and select it
4. Click on the cog icon (on the right)
5. Set **Environment Variable** `persistence.enabled` to `false`
6. Set **Environment Variable** `setDefaultUser.enabled` to `false`
7. Click on **Done Configuring** (top right)
8. Click on **Create New Project** (bottom right)

Wait for your deployment to be successful (green).

**Note**
If you did not change the **Hostname** in the config panel before deploying, the hostname to access Influx should be `cs-influx-real-influxdb` on port `8086`.
If you did change it, check the deployment logs to get the right hostname.

### Deploy Lighthouse and Grafana

On your Project page (there should be only one environment `dev`)

1. Click **Add KintoBlocks...** searchbar, type `lighthouse` (or the name of your lighthouse kintoblock you create previously) and select it
2. In the dropdown on the right, select `Kinto` branch (the only one with a build)
3. Click on the cog icon (on the right)
4. Set **Environment Variable** `HOST` to `cs-influx-real-influxdb` (or the right hostname from your previous deployment logs)
5. Set **Environment Variable** `CRON` to the correct cronjob pattern (example: `0 */10 * * * *`)
6. Set **Environment Variable** `URLS` to one or more urls separated with a `,` (example: `https://www.kintohub.com,https://jfrog.com`)
7. Change the **MEMORY LIMIT** to `1024MB` to make sure lighthouse have enough memory (can probably be set to lower)
8. Click on **Done Configuring** (top right)
9. Click **Add KintoBlocks...** searchbar, type `grafana-webperf` (or the name of your lighthouse kintoblock you create previously) and select it
10. In the dropdown on the right, select `Kinto` branch (the only one with a build)
11. Click on the cog icon (on the right)
12. Set **Environment Variable** `INFLUX_URL` to `http://cs-influx-real-influxdb:8086` (or the right hostname from your previous deployment logs)
13. Set **Environment Variable** `GF_SECURITY_ADMIN_PASSWORD` to the password your wanna use to login to grafana (example: `K1nt0HuB`)
14. Click on **Done Configuring** (top right)
15. Click on **Deploy** (bottom right)

Wait for your deployment to be successful (green).

## Access the dashboard

On your Project page (there should be only one environment `dev`).
In the **KintoBlock** list.

1. Click **Open** under `grafana-webperf` card.

Here you go!
