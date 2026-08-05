NAME = inception

COMPOSE_FILE = srcs/docker-compose.yml

# For Linux
DATA_PATH = /home/$(USER)/data

# For XOS
# DATA_PATH = $(HOME)/data

all: build up

# Build all Docker images
build:
	@echo "Building Docker images..."
	@mkdir -p $(DATA_PATH)/mysql $(DATA_PATH)/wordpress
	@cd srcs/ && docker-compose build

# Start all containers
up:
	@echo "Starting containers..."
	@cd srcs/ && docker-compose up

# Stop all containers
down:
	@echo "Stopping containers..."
	@cd srcs/ && docker-compose down

# Clean up containers and images
clean: down
	@echo "Cleaning up..."
	@docker system prune -af
	@docker volume prune -f

# Full cleanup including data
fclean: clean
	@echo "Full cleanup..."
	@sudo rm -rf $(DATA_PATH)
	@docker system prune -af --volumes

# Rebuild everything from scratch
re: fclean all

# Show container logs
logs:
	@timeout 30s docker-compose -f $(COMPOSE_FILE) logs -f || echo "Log viewing timed out"

# Show container status
status:
	@docker-compose -f $(COMPOSE_FILE) ps

# Declare phony targets (not actual files)
.PHONY: all build up down clean fclean re logs status