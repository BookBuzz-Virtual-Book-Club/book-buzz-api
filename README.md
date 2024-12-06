# book-buzz-api

API Backend built with Ruby on Rails.

BookBuzz is a virtual book club app that allows a user to create and join new book clubs, engage in discussion boards, rate recent reads, and receive AI-generated book recommendations. Book data is sourced from Open Library API.

### Installation

Navigate to your desired directory and use the following command to clone down:

```
git clone https://github.com/BookBuzz-Virtual-Book-Club/book-buzz-api.git
```

change directories into the new clone:

```
cd book-buzz-api
```

Install Ruby if not already installed:

```
brew install ruby
```

Install Rails if not already installed:

```
gem install rails
```

### PostgreSQL Database

If you haven't already, install PostgreSQL with Homebrew:

```
brew install postgresql
```

then start the the PostgreSQL service:

```
brew services start postgresql
```

Create the database by running the following Rails command:

```
rails db:create
```

Run migrations to set up your tables:

```
rails db:migrate
```

Then seed your database:

```
rails db:seed
```

### Usage

To start a local server, run the following command.

```
rails server
```

Visit http://localhost:3000 to view the app.

### Testing

Run test suites with the following command:

```
rails test
```

## Authors

<p>
<a href="https://github.com/robynspaulding">Robyn Spaulding </a>

<a href="https://github.com/perrileah">Leah Perri </a>

</p>
