# Release workflow

The product has two delivery targets with different responsibilities.

## Mobile

Android release builds are produced locally, checked for release readiness, and uploaded to Google Play closed testing. Credentials and signing material stay outside the repository. The private project contains the uploader and release notes used for that workflow.

## Web

Firebase Hosting receives one assembled artifact containing the public educational site and the Flutter application under `/app/`. The build wrapper first creates the Flutter Web output, adds the public pages and legal documents, then runs validators over the assembled directory.

The validation step checks routing, required public pages, canonical metadata, language content, and advertising boundaries. The public Web surface is kept ad-free while the mobile seller file remains available for mobile distribution requirements.

## Why the wrapper matters

A plain `flutter build web` produces only the application shell. The project uses a dedicated assembly step so a release cannot accidentally replace the public guides with an incomplete artifact. The final directory is validated before deployment.

Production credentials, Firebase project settings, deployment commands, and signing configuration remain private and are not reproduced in this case study.
