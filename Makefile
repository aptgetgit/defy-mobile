# Variables
FLUTTER = flutter
DART = dart
BUILD_RUNNER = $(DART) run build_runner

# Phony targets
.PHONY: all clean generate build_apk build_ios

# Default target
all: generate build_apk

# Clean the project
clean:
	@echo "Cleaning the project..."
	@$(FLUTTER) clean
	@$(BUILD_RUNNER) clean

# Generate code (clean by default)
generate:
	@echo "Cleaning and generating code..."
	@$(BUILD_RUNNER) clean
	@$(BUILD_RUNNER) build --delete-conflicting-outputs

# Build Android APK
build_apk: generate
	@echo "Building Android APK..."
	@$(FLUTTER) build apk

# Build iOS
build_ios: generate
	@echo "Building for iOS..."
	@$(FLUTTER) build ios

# Run the app
run: generate
	@echo "Running the app..."
	@$(FLUTTER) run

# Install dependencies
dependencies:
	@echo "Installing dependencies..."
	@$(FLUTTER) pub get

# Upgrade dependencies
upgrade:
	@echo "Upgrading dependencies..."
	@$(FLUTTER) pub upgrade