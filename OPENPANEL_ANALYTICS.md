# OpenPanel Analytics Integration

## Setup

### Package
- [`openpanel_flutter`](https://pub.dev/packages/openpanel_flutter) v0.2.0
- Initialized in `lib/main.dart` via `Openpanel.instance.initialize()`

### Configuration (`lib/core/constants/environment.dart`)

| Variable | Default | Override |
|---|---|---|
| `OPENPANEL_URL` | `https://openpanel.usemandi.com/api` | `--dart-define=OPENPANEL_URL=...` |
| `OPENPANEL_CLIENT_ID` | `8e2a996d-20a6-4d8d-9d9a-cef8ffd2fddb` | `--dart-define=OPENPANEL_CLIENT_ID=...` |
| `OPENPANEL_CLIENT_SECRET` | `sec_5af5c7615e1c4fd94427` | `--dart-define=OPENPANEL_CLIENT_SECRET=...` |

> **Security:** Client secret should be injected via CI/CD, not committed. The current default is for development only.

### Key Fixes
1. **URL must include `/api`** — self-hosted OpenPanel serves the API at `https://<host>/api`, not at the root. Without this, requests hit the SvelteKit web app and get a 307 redirect.
2. **Client secret is required** — without it, the server returns `401 Invalid cors or secret` (checked in `validateSdkRequest` in the OpenPanel API).

## Architecture

```
Flutter App
  └─ openpanel_flutter package
       └─ Dio HTTP client → POST https://openpanel.usemandi.com/api/{event,profile,...}
                            Headers: openpanel-client-id, openpanel-client-secret
  └─ OpenpanelObserver (auto-router tracking)
       └─ AutoRouter listener → Openpanel.instance.event(name: 'pageview', ...)
```

## What's Integrated
- **Auto pageview tracking** — via `OpenpanelObserver` in `app_router.dart`
- **Manual event tracking** — via `Openpanel.instance.event(name: '...', properties: {...})`

## Self-Hosted OpenPanel
- Dashboard: `https://openpanel.usemandi.com`
- API: `https://openpanel.usemandi.com/api`
- Project: Mandi — Flutter client (created via dashboard)
