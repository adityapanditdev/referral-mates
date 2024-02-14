# Referral Mate

Welcome to Referral Mate! This system facilitates user referrals through a user-friendly UI and API endpoints. Built using Ruby on Rails and React, it provides a seamless experience for inviting new users and managing referrals.

## Technologies Used

- Ruby on Rails 7.0.1
- React

## Getting Started

### Prerequisites

Ensure you have the following installed on your system:

- Ruby 3.0.1
- Rails 7
- MySQL
- NodeJS (version > 18x)
- Yarn

### Database Configuration

1. Configure your `database.yml` file according to your local MySQL database setup. You will need to provide your MySQL username and password.

   ```yaml
   default: &default
     adapter: mysql2
     encoding: utf8mb4
     pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
     username: your_mysql_username
     password: your_mysql_password
     socket: /var/run/mysqld/mysqld.sock

### Setup

1. Clone this repository and navigate into the directory:

```sh
git clone https://github.com/adityapanditdev/referral-mate.git && cd referral-mate
```

2. Install dependencies:

```sh
bundle install
```

### Database Configuration

Configure your `database.yml` file according to your local MySQL database setup.

### Usage

1. Run the following command to set up the server:

```sh
bin/setup # Check bundler, create and migrate the database, and install yarn dependencies
```

2. Start the server:

```sh
bin/dev
```

Navigate to http://localhost:3000 to access the application.

## API Request Examples

### Sign Up

- **URL without referral:** `http://localhost:3000/users`
- **URL with referral:** `http://localhost:3000/users?invitation_token={unique invitation token}`
- **Method:** POST

Request Example:

```json
{
  "user": {
   "email": "user@test.com",
   "password": "password",
   "password_confirmation": "password"
  }
}
```

### Sign In

- **URL:** `http://localhost:3000/users/sign_in`
- **Method:** POST

Request Example:

```json
{
  "user": {
    "email": "user@test.com",
    "password": "password"
  }
}
```

### Authentication Headers Example for All Further Queries

```json
{
  "Authorization": "token we get from login api"
}
```

### Referrals of Current User

- **URL:** `http://localhost:3000/invitations`
- **Method:** GET

### Send Invite Email

- **URL:** `http://localhost:3000/invitations`
- **Method:** POST
- **Headers:** `{ Authorization: "token we get from login api" }`

Request Example:

```json
{
  "referral_invitation": {
    "email": "name@domain.com"
  }
}
```

## Author

**Aditya Pandit**

- GitHub: [@adityapanditdev](https://github.com/adityapanditdev)

Feel free to reach out if you have any questions or suggestions!
