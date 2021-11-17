##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.0.2](https://github.com/spinebuster/nt-back/blob/main/.ruby-version#L1)
- Rails [6.1.4.1](https://github.com/spinebuster/nt-back/blob/main/Gemfile#L7)

##### 1. Check out the repository

```bash
git clone git@github.com:spinebuster/nt-back.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following command to create and setup the database.

```bash
make setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
make start
```

And now you can visit the site

##### 5. Test the application with RSpec

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
