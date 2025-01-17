# Real-Time SMS Notification System

## Overview

This Ruby on Rails application implements a real-time SMS notification system, leveraging Rails 7 features and Twilio's SMS API. It is designed to trigger SMS notifications in response to specific events within the application, such as the registration of a new user.

## Key Features

- **Trigger-Based Notifications:** Configures triggers within the application (e.g., new user signup) to send SMS notifications.
- **SMS API Integration:** Integrates with the Twilio SMS API to dispatch real-time notifications.
- **Rails 7 Backend Processing:** Utilizes the latest Rails 7 features for efficient backend processing.
- **Front-end Interface:** (Optional) Includes a simple interface styled using Tailwind CSS for setting up triggers and notifications.

## Getting Started

### Prerequisites

- Ruby 3.0.1
- Rails 7.0.8
- SQLite (for development and testing environments)
- A Twilio account for the SMS API

### Setup

1. **Download and extract the project files**

    ```bash
    cd <project-directory>
    ```

2. **Install dependencies**

    ```bash
    bundle install
    ```

3. **Configure Rails credentials**

    Edit the Rails credentials file to include your Twilio API keys:

    ```bash
    EDITOR="your_editor --wait" rails credentials:edit
    ```

    Add your Twilio details under the `twilio` key:

    ```yaml
    twilio:
      twilio_account_sid: your_account_sid
      twilio_auth_token: your_auth_token
      twilio_from_number: your_twilio_number
      twilio_test_phone: your_test_phone_number
    ```

4. **Database setup**

    Run the following commands to create and setup your database:

    ```bash
    rails db:create db:migrate
    ```

5. **Start the server**

    Launch the Rails server:

    ```bash
    rails server
    ```

## Usage

The application uses Tailwind CSS to style its simple yet elegant frontend pages. We have for now, set up an SMS triggering service when a new user joins the platform or signs up. We can also add this feature to other triggers including sign in, sign out or any other particular activity. As the backend of Twilio service, we have used the gem 'twilio-ruby'. The application formatting and syntax have been tested and verified by Rubocop. Other than this, there is a complete coverage of test cases for service functionality.

## Testing

This project uses RSpec for testing. To execute tests, ensure you have the following two lines set in your test file:

```ruby
let(:from_number) { '11111111111' } # Value set in your Rails credentials
let(:test_number) { '00000000000' } # Value set in your Rails credentials
```

To run the tests, execute the following command:

```bash
bundle exec rspec
```
