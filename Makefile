.DEFAULT_GOAL:=help
SHELL:=/bin/zsh

.PHONY: help list prune build setup setup_test install start restart console test rubocop

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

list: ## Docker list images
	$(info Docker list images)
	@docker image list

prune: ## Remove unused Docker data
	$(info Unused Docker data)
	@docker system prune

build: ## Build NtBack Docker image
	$(info Building NtBack)
	@docker-compose build

setup: ## Drops the current database and creates it from scratch
	$(info Creating NtBack database)
	@docker-compose run --rm app rails db:drop db:create db:migrate db:seed

setup_test: ## Drops the current test database and creates it from scratch
	$(info Creating NtBack database)
	@docker-compose run --rm app rails db:drop db:create db:migrate RAILS_ENV=test

install:  ## Checks and installs dependencies
	$(info Checking and getting dependencies)
	@docker-compose run --rm app sh -c "bundle check || bundle install"

start: ## Starts the development server
	$(info Starting the development server)
	@docker-compose run --rm --service-ports app rails s -b 0.0.0.0

restart: ## Restarts the development server
	$(info Restarting all the containers and then starting the development server)
	@docker-compose restart
	@docker-compose run --rm --service-ports app rails s -b 0.0.0.0

console: ## Starts the development console
	$(info Starting the development console)
	@docker-compose run --rm app rails c

test: ## Starts the test runner
	$(info Running tests)
	@docker-compose run --rm app rspec

rubocop: ## Rubocop
	$(info  Running Rubocop)
	@docker-compose run --rm app rubocop -A

reek: ## Reek
	$(info  Running Reek)
	@docker-compose run --rm app reek --no-documentation .
