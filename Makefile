# Variables
FLUTTER = flutter
DART = dart
BUILD_RUNNER = $(DART) run build_runner
FLUTTER_LAUNCHER_ICONS = $(DART) run flutter_launcher_icons

# Phony targets
.PHONY: all clean generate build_apk build_ios run dependencies upgrade icons l10n

# Default target
all: icons generate l10n build_apk

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

# Generate internationalization
l10n:
	@echo "Generating internationalization files..."
	@$(FLUTTER) gen-l10n

# Build Android APK
build_apk: generate l10n
	@echo "Building Android APK..."
	@$(FLUTTER) build apk

# Build iOS
build_ios: generate l10n
	@echo "Building for iOS..."
	@$(FLUTTER) build ios

# Run the app
run: generate l10n
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

# Generate launcher icons
icons:
	@echo "Generating launcher icons..."
	@$(FLUTTER_LAUNCHER_ICONS)