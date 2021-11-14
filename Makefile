.DEFAULT_GOAL:=help
SHELL:=/bin/zsh

.PHONY: help setup setup_test install start console test rubocop reek

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

setup: ## Drops the current database and creates it from scratch
	$(info Creating NtBack database)
	@bundle exec rails db:drop db:create db:migrate db:seed

setup_test: ## Drops the current test database and creates it from scratch
	$(info Creating NtBack database)
	@bundle exec rails db:drop db:create db:migrate RAILS_ENV=test

install:  ## Checks and installs dependencies
	$(info Checking and getting dependencies)
	@sh -c "bundle check || bundle install"

start: ## Starts the development server
	$(info Starting the development server)
	@bundle exec rails s

console: ## Starts the development console
	$(info Starting the development console)
	@bundle exec rails c

test: ## Starts the test runner
	$(info Running tests)
	@bundle exec rspec

rubocop: ## Rubocop
	$(info  Running Rubocop)
	@rubocop -A

reek: ## Reek
	$(info  Running Reek)
	@reek --no-documentation .
