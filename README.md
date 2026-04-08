# Ephemeral IaaS on GitHub Actions

Production-ready ephemeral compute system using GitHub Actions.

## 🚀 Usage

### Manual Trigger
1. Go to Actions → Ephemeral IaaS Worker
2. Click "Run workflow"
3. Select task and priority

### Scheduled
Runs every 6 hours by default. Modify `.github/workflows/ephemeral-iaas.yml` to adjust.

### Webhook Trigger
Send POST to `https://api.github.com/repos/{owner}/{repo}/dispatches`:
```json
{
  "event_type": "trigger-task",
  "client_payload": { "task": "sync" }
}