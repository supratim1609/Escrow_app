# Escrow App

## Overview
The Escrow App is a secure transaction platform designed to facilitate safe exchanges between buyers and sellers. It ensures that funds are held in escrow until both parties fulfill their commitments, preventing fraud and disputes.

## Features
- **Secure Escrow Transactions** – Funds are held securely until conditions are met.
- **User Authentication** – Secure login and verification using Firebase Auth / OAuth.
- **Multi-Party Agreement** – Transactions require mutual confirmation before release.
- **Dispute Resolution** – In-app dispute handling for failed transactions.
- **Notifications** – Real-time transaction updates via push notifications.
- **Transaction History** – View detailed records of past transactions.

## Tech Stack
- **Framework**: Flutter (Dart)
- **State Management**: Riverpod / Provider
- **Database**: Firebase Firestore / PostgreSQL
- **Authentication**: Firebase Auth 
- **Notifications**: Firebase Cloud Messaging (FCM)
- **Cloud Functions**: Firebase Functions for backend logic
- **Navigation**: GoRouter

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/escrow-app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd escrow-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## How It Works
1. **Create an Escrow Transaction** – A buyer initiates a transaction.
2. **Hold Agreement Securely** – The escrow system records the agreement until both parties confirm fulfillment.
3. **Confirm & Close** – Upon confirmation from both parties, the transaction is marked as complete.
4. **Dispute Handling** – If a dispute arises, the app provides a resolution mechanism.

## Contributing
Pull requests are welcome! Follow best practices for coding and documentation.

## License
MIT License. See `LICENSE` for details.

---


