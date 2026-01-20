.PHONY: build run clean test install

# Default target
all: build

# Build the project
build:
	zig build-exe src/main.zig -O ReleaseSafe

# Run the application
run: build
	./main

# Clean build artifacts
clean:
	rm -f main main.o
	rm -rf zig-cache zig-out

# Run tests
test:
	zig test src/main.zig

# Install to a specific prefix (default: /usr/local)
PREFIX ?= /usr/local
install: build
	install -d $(PREFIX)/bin
	install -m 755 main $(PREFIX)/bin/zig-app

# Development build (debug mode)
dev:
	zig build-exe src/main.zig -O Debug

# Show help
help:
	@echo "Available targets:"
	@echo "  build    - Build the project (release safe)"
	@echo "  run      - Build and run the application"
	@echo "  clean    - Remove build artifacts"
	@echo "  test     - Run tests"
	@echo "  install  - Install binary to PREFIX (default: /usr/local)"
	@echo "  dev      - Build in debug mode"
	@echo "  help     - Show this help message"
