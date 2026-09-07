# Firebase boundary

Firebase provides identity and synchronized family data. The Flutter application treats it as an infrastructure boundary rather than allowing feature widgets to call Firebase APIs directly.

```text
Sign-in and session lifecycle
            ↓
Authenticated application shell
            ↓
Feature providers and repositories
            ↓
Firestore documents owned by the current family
```

## Authentication

The app supports authenticated parent sessions and a controlled child mode. Session changes are propagated through the application shell so feature providers can clear, hydrate, or rebuild state at the right lifecycle boundary.

## Firestore access

Repositories translate domain operations into reads, writes, queries, and listeners. Ownership checks and server-side rules remain part of the private production project. This case study does not publish collection names, rule source, Firebase project identifiers, or client configuration.

## Sync and offline behavior

Local state allows the UI to remain useful while a connection is unavailable. Synchronization code handles hydration, incremental updates, stale snapshots, retries, and cleanup when the authenticated child or parent changes. Critical money and reward operations are reconciled so a retry does not create an unintended duplicate result.

## Testing boundary

The production project uses local and mocked repository implementations for feature tests, with focused security and synchronization tests around the remote boundary. The public samples show the shape of these boundaries without connecting to a Firebase project.
