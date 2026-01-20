.PHONY: all build run clean test install dev help

NAME := devops-lecture
SRC := src/main.zig
BUILD_DIR := zig-out/bin
EXECUTABLE := $(BUILD_DIR)/$(NAME)

# Default target
all: build

# Build the project
build:
	mkdir -p $(BUILD_DIR)
	zig build-exe $(SRC) -O ReleaseSafe --name $(NAME)
	mv $(NAME) $(EXECUTABLE)

# Run the application
run: build
	$(EXECUTABLE)

# Clean build artifacts
clean:
	rm -rf zig-cache zig-out

# Run tests
test:
	zig test $(SRC)

# Install to a specific prefix (default: /usr/local)
PREFIX ?= /usr/local
install: build
	install -d $(PREFIX)/bin
	install -m 755 $(EXECUTABLE) $(PREFIX)/bin/

# Development build (debug mode)
dev:
	mkdir -p $(BUILD_DIR)
	zig build-exe $(SRC) -O Debug --name $(NAME)
	mv $(NAME) $(EXECUTABLE)


# Show help
help:
	@echo "Available targets:"
	@echo "  all      - Build the project (default)"
	@echo "  build    - Build the project (release safe)"
	@echo "  run      - Build and run the application"
	@echo "  clean    - Remove build artifacts"
	@echo "  test     - Run tests"
	@echo "  install  - Install binary to PREFIX (default: /usr/local)"
	@echo "  dev      - Build in debug mode"
	@echo "  help     - Show this help message"
