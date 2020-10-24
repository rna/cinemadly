
# Cinemadly - A Social networking app for Cinema lovers

> Building Cinemadly, a social networking app where users can follow each other, rate movies, view movies rated by other following users.

![User Home page](https://i.imgur.com/uhhByiS.png)

## Table of Contents

- [Features](#features)
- [Built With](#built-with)
- [Live Demo](#live-demo)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [Roadmap](#roadmap)
- [Authors](#authors)
- [Acknowledgements](#acknowledgements)

## Features

- Allows user to register, login and logout.

- User can upload their profile image, which is an optional.

- Users can follow each other.

- User can view the profile of the other user irrespective of their relationship.

- User can add the movie to their library through global movie database search engine.

- User can rate the movie after adding to their library and also they can rate other following users library.

- User can see their rating and average rating of the movie.

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.0.2.2
- Rspec
- OMDB API (Movie Database)
- Cloudinary (Storage of images)
- Bootstrap

## Live Demo

[Live Demo Link](https://cinemadly.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Windows

```sh
https://www.ruby-lang.org/es/documentation/installation/#rubyinstaller
https://gorails.com/setup/windows/10
```

- Ubuntu 18.04

```sh
sudo apt-get install ruby-full
gem install rails -v 5.2.4
```
<!-- ### Setup -->

### Installation

Clone the repo with:

```sh
git clone https://github.com/rna/cinemadly
```

Instal gems with:

```sh
bundle install
```

Setup database with:

```sh
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```sh
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```sh
    rpsec --format documentation
```
## Roadmap
- [ ] Enhancement of User Interface and design 
- [ ] Latest feed for trending movies and TV shows
- [ ] Registration confirmation through email and Password recovery
- [ ] Integrating Social login

<!-- ### Deployment -->

### Author

👤 **Ramesh Naidu Allu**

- Github: [@rna](https://github.com/rna)
- Twitter: [@rnadev](https://twitter.com/rnadev)
- Linkedin: [Linkedin](https://linkedin.com/in/rnadev)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella)

## 📝 License

This project is [MIT](lic.url) licensed.
