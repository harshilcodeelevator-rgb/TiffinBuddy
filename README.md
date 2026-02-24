# TiffinBuddy (Flutter Startup + MCA Project)

TiffinBuddy is a multi-role tiffin platform focused on local home-cooked food subscriptions for students and professionals in cities like Surat and Ahmedabad.

## Implemented Scope in this Starter

- Role-based login flow (Customer / Provider / Admin).
- Customer module:
  - Browse approved tiffin providers
  - Place sample order
  - Track own orders
- Provider module:
  - View incoming orders
  - Update order statuses
  - View earnings summary
- Admin module:
  - Provider approval workflow
  - Orders + commission summary
- Project architecture built for Firebase integration.

## Tech Stack

- Flutter (UI)
- Provider (state management)
- Firebase-ready dependencies:
  - `firebase_auth` for OTP
  - `cloud_firestore` for DB
  - `firebase_messaging` for notifications
- Razorpay package included for payment integration.

## Firebase Data Model (Firestore)

### 1. `users`
- `id`
- `name`
- `phone`
- `role` (`customer` | `provider` | `admin`)
- `location`
- `isActive`
- `createdAt`

### 2. `providers`
- `id`
- `ownerUserId`
- `kitchenName`
- `city`
- `address`
- `isApproved`
- `kycDocUrl`
- `ratingAvg`
- `ratingCount`
- `deliverySlots` (array)

### 3. `menus`
- `id`
- `providerId`
- `dayOfWeek`
- `mealType` (`lunch` | `dinner`)
- `items` (array)
- `price`
- `isAvailable`

### 4. `orders`
- `id`
- `customerId`
- `providerId`
- `menuId`
- `amount`
- `paymentMode` (`upi` | `cod` | `razorpay`)
- `paymentStatus`
- `status` (`pending`, `accepted`, `outForDelivery`, `delivered`, `cancelled`)
- `deliveryAddress`
- `orderedAt`

### 5. `subscriptions`
- `id`
- `customerId`
- `providerId`
- `planType` (`weekly` | `monthly`)
- `startDate`
- `endDate`
- `pauseDates` (array)
- `isActive`

### 6. `reviews`
- `id`
- `customerId`
- `providerId`
- `orderId`
- `rating`
- `comment`
- `createdAt`

### 7. `commissions`
- `id`
- `orderId`
- `providerId`
- `adminPercent`
- `commissionAmount`
- `settlementStatus`

## Suggested Roadmap

1. Setup Firebase and flavor-based environments (dev/prod).
2. Replace mock login with real OTP auth.
3. Replace in-memory services with Firestore repositories.
4. Add Razorpay + webhook verification backend.
5. Add FCM notifications (new order, status updates, subscription reminder).
6. Add pause/resume subscription calendar flow.
7. Add geo-filtering for city/locality and delivery radius.
8. Build responsive web admin panel.
9. Add analytics + reports + export CSV.
10. Deploy and run pilot in one city.

## Run

1. Install Flutter SDK.
2. `flutter pub get`
3. `flutter run`

> Note: This repository currently uses mock in-app data so it can be explored quickly before Firebase wiring.
