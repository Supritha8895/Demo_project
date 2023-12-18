# webhook_app Application

A brief description of this Ruby application.

## Prerequisites

- Ruby (version 2.6.5)
- Bundler gem (`gem install bundler`)

## Installation

1. Clone the repository: `git clone https://github.com/Supritha8895/Demo_project.git`
2. Change into the project directory: `cd webhook_app`
3. Install dependencies: `bundle install`

## Usage

To run the Rails application, use the following command:

```bash
rails s
# WebhookController

The `WebhookController` in this application is responsible for handling incoming webhook requests related to product records. It provides endpoints for creating and updating product information and utilizes the `TwilioNotificationService` to send SMS notifications for successful record creation and updates.
## Features

- **Create Endpoint:** Allows the creation of new product records via webhook requests.
- **Update Endpoint:** Supports updating existing product records through webhook requests.
- **Twilio Integration:** Utilizes the `TwilioNotificationService` to send SMS notifications upon successful record creation and updates.

## Usage

To interact with the `WebhookController`, send HTTP requests to the following endpoints:

- **Create Product:** `POST /webhook/create`
  - Parameters: `name` (string), `data` (string), `phone_number` (string)
  - Returns:
    - Success: HTTP status 201 Created with a JSON response `{ message: 'Record created successfully' }`
    - Failure: HTTP status 422 Unprocessable Entity with a JSON response `{ errors: ['Error message 1', 'Error message 2', ...] }`

- **Update Product:** `PUT /webhook/update/:id`
  - Parameters: `name` (string), `data` (string), `phone_number` (string)
  - Returns:
    - Success: HTTP status 200 OK with a JSON response `{ message: 'Record updated successfully' }`
    - Failure: HTTP status 422 Unprocessable Entity with a JSON response `{ errors: ['Error message 1', 'Error message 2', ...] }`

## Dependencies

- **HTTParty:** Used for HTTP requests in the `WebhookController`.
- **TwilioNotificationService:** Integrates with Twilio to send SMS notifications.

## Examples

### Create a Product Record

```bash
curl -X POST http://your-app-url/webhook/create -d "name=Product1&data=SomeData&phone_number=1234567890"

curl -X PUT http://your-app-url/webhook/update/1 -d "name=UpdatedProduct&data=UpdatedData&phone_number=9876543210"

## Twilio Integration

This application integrates with Twilio to provide SMS notifications for certain events. Follow the steps below to set up Twilio integration:

### Prerequisites

- Create a Twilio account: [Twilio Sign Up](https://www.twilio.com)
- Obtain your Twilio Account SID and Auth Token from the Twilio console.

### Configuration

Set the following environment variables in your application:

```bash
export TWILIO_ACCOUNT_SID: "AC0c4a9ce5f6750d9ef79e46e8284df43b"
export TWILIO_AUTH_TOKEN: "d418c3220b5d04dbc997a4a210e89371"
export TWILIO_PHONE_NUMBER: "+12058394864"



