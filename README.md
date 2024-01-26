# Tea Subscription BE README

## Getting Started

- Fork this repository to your GitHub account.
- Clone your forked repository by clicking on code and copying your SSH URL and typing 'git clone < your Github SSH >' into your terminal.

## Endpoints

### POST /customers/:customer_id/subscriptions

- This endpoint creates a new subscription for a customer and returns information about that subscription.
  - Headers: 'Content-Type: application/json Accept: application/json'
  - Return data: returns the title of the subscription plan, the price in $, the status (active or cancelled) and the the frequency in days.

### PATCH /customers/:customer_id/subscriptions/:subscription_id/cancel

- This endpoint allows cancellation of an existing tea subscription.
  - Headers: 'Content-Type: application/json Accept: application/json'
  - Return data: returns the title of the subscription plan, the price in $, the status (cancelled) and the the frequency in days. 

### GET /customers/:customer_id/subscriptions

- This endpoint gives info for all subscriptions (active and cancelled) for a customer
  - Headers: 'Content-Type: application/json Accept: application/json'
  - Return data: returns the title of the subscription plan, the price in $, the status (cancelled) and the the frequency in days. 
