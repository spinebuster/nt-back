##### NtBack

NtBack has been developed to manage the cash register in a store. This store will sell
products which could have different prices at different points of time and some discounts
could be applied. The system considers the price of the product and if a discount applies
in order to generate a correct cash register order. Discount logic includes:
- A 2-for-1 special on the item.
- If you buy 3 or more of a specific item, the price per unit should be different.

##### Architecture and models

NtBack is being devoloped as a complete RESTful API usign three main agents. Controllers - Services - Models

The concept of a controller is quite simple. It just returns a JSON data block with a standard response that
specifies if the request has been executed correctly or if an error has been raised. It only interacts with
Services passing the params variable depending on the request.

Services have been conceived to contain all the interactions with the different models in order to provide
an answer to the request. Due to some concerns that answer could be indexated, paginated or even served using
a specific template rule. Distinguishing services from controllers allow us develop more accurate tests that
check not only if the request is doing what we expect but also if the request itself is correct or not. 

Lastly, models contain all the interaction with the database, they cointais also validations, relations and callbaks

Everything is commented and tested!!!

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.0.2](https://github.com/spinebuster/nt-back/blob/main/.ruby-version#L1)
- Rails [6.1.4.1](https://github.com/spinebuster/nt-back/blob/main/Gemfile#L7)
- Docker 20.10.11
- docker-compose 1.25.3

##### 1. Check out the repository

```bash
git clone git@github.com:spinebuster/nt-back.git
```

##### 3. Create .env files with database connection config

Copy the samples .env-app and .env-db files and edit the values of the ENV variables.

```bash
cp .env-app.sample cp .env-app
cp .env-db.sample cp .env-db
```

##### 3. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 5. Build Docker container

Run the following command to build the Docker container with everthing needed to run the project.

```bash
make build
```

##### 5. Create and setup the database

Run the following command to create and setup the database including some seeds.

```bash
make setup
```

##### 6. Start the Rails server

You can start the rails server using the command given below.

```bash
make start
```

And now you can visit the site. Root path redirects to the index of products so that is the first
sniff of NtBack. Feel free to check different request according to the RESTful architecture.

##### 7. Test the application with RSpec

You can run the suite of test as follows. Run the following command to create and setup the database.

```bash
make setup_test
```

Run the following command to run the suite of test.

```bash
make test
```

##### Check Makefile

Project comes with a bunch a tools that can be checked within the Makefile file. Please check the help prompt with the following command.

```bash
make help
```
