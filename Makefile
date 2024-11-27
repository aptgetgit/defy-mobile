# Variables
FLUTTER := flutter
DART := dart
BUILD_RUNNER := $(DART) run build_runner
FLUTTER_LAUNCHER_ICONS := $(DART) run flutter_launcher_icons
PROJECT_NAME := $(shell grep 'name: ' pubspec.yaml | sed 's/name: //')
L10N_DIR := lib/l10n
GENERATED_DIR := $(L10N_DIR)/generated

# Colors and emoji for better visibility
GREEN := \033[0;32m
RED := \033[0;31m
BLUE := \033[0;34m
NC := \033[0m # No Color

# Phony targets
.PHONY: all clean generate build test coverage \
        build_apk build_ios run watch \
        dependencies upgrade icons l10n format \
        check clean-l10n help

# Default target
all: help

# Help target
help:
	@echo "$(BLUE)Available targets for $(PROJECT_NAME):$(NC)"
	@echo "$(GREEN)make all$(NC)          - Run icons, generate, l10n, and build_apk"
	@echo "$(GREEN)make clean$(NC)        - Clean the project and generated files"
	@echo "$(GREEN)make generate$(NC)     - Generate code using build_runner"
	@echo "$(GREEN)make watch$(NC)        - Watch for changes and regenerate code"
	@echo "$(GREEN)make l10n$(NC)         - Generate internationalization files"
	@echo "$(GREEN)make build_apk$(NC)    - Build Android APK"
	@echo "$(GREEN)make build_ios$(NC)    - Build iOS app"
	@echo "$(GREEN)make run$(NC)          - Run the app in debug mode"
	@echo "$(GREEN)make test$(NC)         - Run all tests"
	@echo "$(GREEN)make coverage$(NC)     - Run tests with coverage"
	@echo "$(GREEN)make dependencies$(NC) - Install dependencies"
	@echo "$(GREEN)make upgrade$(NC)      - Upgrade dependencies"
	@echo "$(GREEN)make icons$(NC)        - Generate launcher icons"
	@echo "$(GREEN)make format$(NC)       - Format all Dart files"
	@echo "$(GREEN)make check$(NC)        - Run static analysis"

# Check if flutter is installed
check-flutter:
	@which $(FLUTTER) > /dev/null || (echo "$(RED)❌ Flutter not found. Please install Flutter first.$(NC)" && exit 1)

# Check if pubspec.yaml exists
check-pubspec:
	@test -f pubspec.yaml || (echo "$(RED)❌ pubspec.yaml not found. Are you in the right directory?$(NC)" && exit 1)

# Clean the project
clean: check-flutter
	@echo "🧹 Cleaning the project..."
	@$(FLUTTER) clean
	@$(BUILD_RUNNER) clean
	@rm -rf coverage/
	@echo "✨ Clean completed"

# Generate code with watch mode
watch: check-flutter check-pubspec
	@echo "👀 Watching for code changes..."
	@$(BUILD_RUNNER) watch --delete-conflicting-outputs

# Generate code (clean by default)
generate: check-flutter check-pubspec
	@echo "🏗️  Generating code..."
	@$(BUILD_RUNNER) clean
	@$(BUILD_RUNNER) build --delete-conflicting-outputs

# Clean generated l10n files
clean-l10n:
	@echo "🧹 Cleaning l10n files..."
	@rm -rf $(GENERATED_DIR)/*
	@mkdir -p $(GENERATED_DIR)

# Generate internationalization
l10n: check-flutter clean-l10n
	@echo "🌍 Generating internationalization files..."
	@$(FLUTTER) gen-l10n && echo "✅ L10n generation complete!" || \
		(echo "$(RED)❌ L10n generation failed$(NC)" && exit 1)

# Build Android APK
build_apk: check-flutter generate l10n
	@echo "📱 Building Android APK..."
	@$(FLUTTER) build apk --release && \
		echo "✅ APK built successfully!" || \
		(echo "$(RED)❌ APK build failed$(NC)" && exit 1)

# Build iOS
build_ios: check-flutter generate l10n
	@echo "🍎 Building for iOS..."
	@$(FLUTTER) build ios --release && \
		echo "✅ iOS build successful!" || \
		(echo "$(RED)❌ iOS build failed$(NC)" && exit 1)


# Run tests
test: check-flutter
	@echo "🧪 Running tests..."
	@$(FLUTTER) test

# Run tests with coverage
coverage: check-flutter
	@echo "📊 Running tests with coverage..."
	@$(FLUTTER) test --coverage
	@$(DART) run coverage:format_coverage --lcov --in=coverage/lcov.info --out=coverage/lcov.formatted --report-on=lib
	@echo "✅ Coverage report generated"

# Run the app
run: check-flutter generate l10n
	@echo "▶️  Running the app..."
	@$(FLUTTER) run

# Install dependencies
dependencies: check-flutter check-pubspec
	@echo "📦 Installing dependencies..."
	@$(FLUTTER) pub get && \
		echo "✅ Dependencies installed!" || \
		(echo "$(RED)❌ Failed to install dependencies$(NC)" && exit 1)

# Upgrade dependencies
upgrade: check-flutter check-pubspec
	@echo "⬆️  Upgrading dependencies..."
	@$(FLUTTER) pub upgrade && \
		echo "✅ Dependencies upgraded!" || \
		(echo "$(RED)❌ Failed to upgrade dependencies$(NC)" && exit 1)

# Generate launcher icons
icons: check-flutter check-pubspec
	@echo "🎨 Generating launcher icons..."
	@$(FLUTTER_LAUNCHER_ICONS) && \
		echo "✅ Icons generated!" || \
		(echo "$(RED)❌ Failed to generate icons$(NC)" && exit 1)

# Format code
format: check-flutter
	@echo "✨ Formatting code..."
	@$(DART) format lib test

# Static analysis
check: check-flutter
	@echo "🔍 Running static analysis..."
	@$(FLUTTER) analyze