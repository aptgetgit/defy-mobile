# Required tools and files
REQUIRED_EXECUTABLES := flutter dart
REQUIRED_FILES := pubspec.yaml

# Project root - where pubspec.yaml exists
PROJECT_ROOT := $(shell pwd)
PUBSPEC_FILE := $(PROJECT_ROOT)/pubspec.yaml
PACKAGES_DIR := $(PROJECT_ROOT)/packages

# Flutter and Dart commands
FLUTTER_CMD := flutter
DART_CMD := dart

# Build tools and runners
BUILD_RUNNER_CMD := $(DART_CMD) run build_runner
FLUTTER_LAUNCHER_ICONS_CMD := $(DART_CMD) run flutter_launcher_icons
FLUTTER_NATIVE_SPLASH_CMD := $(DART_CMD) run flutter_native_splash
CUSTOM_LINT_CMD := $(DART_CMD) run custom_lint

# Project directories structure
LIB_DIR := $(PROJECT_ROOT)/lib
TEST_DIR := $(PROJECT_ROOT)/test
BUILD_DIR := $(PROJECT_ROOT)/build
L10N_DIR := $(LIB_DIR)/l10n
GENERATED_DIR := $(L10N_DIR)/generated

# Platform specific directories
IOS_DIR := $(PROJECT_ROOT)/ios
ANDROID_DIR := $(PROJECT_ROOT)/android

# Generated file patterns
GENERATED_FILE_PATTERNS := *.g.dart *.freezed.dart *.gr.dart *.config.dart *.mocks.dart *.chopper.dart *.objectbox.g.dart

# Cache directories
DART_TOOL_DIR := $(PROJECT_ROOT)/.dart_tool
PUB_CACHE_DIR := $(HOME)/.pub-cache

# Terminal colors
COLOR_GREEN := \033[0;32m
COLOR_RED := \033[0;31m
COLOR_BLUE := \033[0;34m
COLOR_RESET := \033[0m

# Environment check function
define check_environment
	@echo "🔍 Checking development environment..."
	@cd $(PROJECT_ROOT) || { \
		echo "$(COLOR_RED)❌ Could not change to project root directory$(COLOR_RESET)" >&2; \
		exit 1; \
	}
	@for cmd in $(REQUIRED_EXECUTABLES) ; do \
		command -v $$cmd >/dev/null 2>&1 || { \
			echo "$(COLOR_RED)❌ Required command not found: $$cmd$(COLOR_RESET)" >&2; \
			exit 1; \
		}; \
	done
	@for file in $(REQUIRED_FILES) ; do \
		if [ ! -f "$$file" ]; then \
			echo "$(COLOR_RED)❌ Required file not found: $$file$(COLOR_RESET)" >&2; \
			exit 1; \
		fi \
	done
	@echo "✅ Environment check passed"
endef

# Add environment check to each target
check-environment:
	$(call check_environment)

# PHONY targets declaration
.PHONY: all help check-environment clean-flutter clean-builder clean-coverage clean-ios \
        clean-android clean-dart-tool clean-objectbox clean-l10n clean-icons clean-spash clean \
        generate-builder generate-l10n generate-icons generate-splash generate deps-get deps-upgrade \
        deps-outdated deps-doctor deps-clean-cache dependencies upgrade format-dart \
        format-check lint custom-lint format check \
		build build-apk build-ios

# Default target
all: help

# Help target
help:
	$(call check_environment)
	@echo "$(COLOR_BLUE)Available targets for $(PROJECT_NAME):$(COLOR_RESET)"
	@echo "$(COLOR_GREEN)make all$(COLOR_RESET)          - Run icons, generate, l10n, and build_apk"
	@echo "$(COLOR_GREEN)make clean$(COLOR_RESET)        - Clean the project and generated files"
	@echo "$(COLOR_GREEN)make generate$(COLOR_RESET)     - Generate code using build_runner"
	@echo "$(COLOR_GREEN)make deps-get$(COLOR_RESET)     - Get project dependencies"
	@echo "$(COLOR_GREEN)make format$(COLOR_RESET)       - Format all Dart files"
	@echo "$(COLOR_GREEN)make check$(COLOR_RESET)        - Run all checks (format, lint, analyze)"

# Clean targets with proper directory handling
clean-flutter:
	@echo "📱 Cleaning Flutter build..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) clean || \
		(echo "$(COLOR_RED)❌ Flutter clean failed$(COLOR_RESET)" && exit 1)

clean-builder:
	@echo "🗑️  Cleaning build_runner generated files..."
	@cd $(PROJECT_ROOT) && $(BUILD_RUNNER_CMD) clean || \
		(echo "$(COLOR_RED)❌ Build runner clean failed$(COLOR_RESET)" && exit 1)
	@cd $(PROJECT_ROOT) && for pattern in $(GENERATED_FILE_PATTERNS); do \
		find . -type f -name "$$pattern" ! -path "*/packages/*" -delete; \
	done

clean-coverage:
	@echo "🗑️  Removing coverage directory..."
	@rm -rf $(PROJECT_ROOT)/coverage

clean-ios:
	@echo "🗑️  Cleaning iOS specific files..."
	@rm -rf $(IOS_DIR)/Pods
	@rm -rf $(IOS_DIR)/.symlinks
	@rm -rf $(IOS_DIR)/Flutter/Flutter.framework
	@rm -rf $(IOS_DIR)/Flutter/Flutter.podspec

clean-android:
	@echo "🗑️  Cleaning Android specific files..."
	@rm -rf $(ANDROID_DIR)/.gradle
	@rm -rf $(ANDROID_DIR)/app/build
	@rm -rf $(ANDROID_DIR)/build

clean-dart-tool:
	@echo "🗑️  Cleaning Dart tool..."
	@rm -rf $(DART_TOOL_DIR)
	@rm -rf $(PUB_CACHE_DIR)

clean-objectbox:
	@echo "🗑️  Cleaning ObjectBox files..."
	@find $(LIB_DIR) -type f -name "objectbox-model.json" ! -path "*/packages/*" -delete
	@find $(LIB_DIR) -type f -name "*.objectbox.g.dart" ! -path "*/packages/*" -delete
	@rm -rf $(DART_TOOL_DIR)/objectbox

clean-l10n:
	@echo "🗑️  Cleaning l10n files..."
	@rm -rf $(GENERATED_DIR)/*
	@rm -rf $(DART_TOOL_DIR)/flutter_gen/*
	@rm -rf $(LIB_DIR)/generated/intl/*
	@rm -rf $(L10N_DIR)/generated/*

clean-icons:
	@echo "🗑️  Cleaning icons..."
	@rm -rf $(IOS_DIR)/Runner/Assets.xcassets/AppIcon.appiconset/*
	@rm -rf $(ANDROID_DIR)/app/src/main/res/mipmap-*/*

clean-splash:
	@echo "🗑️  Cleaning splash screens..."
	@rm -rf $(IOS_DIR)/Runner/Assets.xcassets/LaunchImage.imageset/*
	@rm -rf $(IOS_DIR)/Runner/Base.lproj/LaunchScreen.storyboard
	@rm -rf $(ANDROID_DIR)/app/src/main/res/drawable-*/*splash*
	@rm -rf $(ANDROID_DIR)/app/src/main/res/drawable/*splash*

# Main clean target
clean: check-environment clean-flutter clean-builder clean-coverage clean-ios \
       clean-android clean-dart-tool clean-objectbox clean-l10n clean-icons clean-splash
	@echo "✨ Deep clean completed successfully!"

# Generate targets
generate-builder:
	@echo "📦 Running build_runner..."
	@cd $(PROJECT_ROOT) && $(BUILD_RUNNER_CMD) build --delete-conflicting-outputs || \
		(echo "$(COLOR_RED)❌ Build runner failed$(COLOR_RESET)" && exit 1)

generate-l10n:
	@echo "🌍 Generating l10n files..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) gen-l10n || \
		(echo "$(COLOR_RED)❌ L10n generation failed$(COLOR_RESET)" && exit 1)

generate-icons:
	@echo "🎨 Generating launcher icons..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_LAUNCHER_ICONS_CMD) || \
		(echo "$(COLOR_RED)❌ Icon generation failed$(COLOR_RESET)" && exit 1)

generate-splash:
	@echo "💦 Generating splash screen..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_NATIVE_SPLASH_CMD):create || \
		(echo "$(COLOR_RED)❌ Splash screen generation failed$(COLOR_RESET)" && exit 1)

# Main generate target
generate: check-environment generate-icons generate-splash generate-l10n generate-builder
	@echo "✨ Code generation completed successfully!"

# Dependencies management
deps-get:
	@echo "📦 Getting dependencies..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) pub get || \
		(echo "$(COLOR_RED)❌ Failed to get dependencies$(COLOR_RESET)" && exit 1)

deps-upgrade:
	@echo "⬆️  Upgrading dependencies..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) pub upgrade || \
		(echo "$(COLOR_RED)❌ Failed to upgrade dependencies$(COLOR_RESET)" && exit 1)

deps-outdated:
	@echo "🔍 Checking outdated dependencies..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) pub outdated || \
		(echo "$(COLOR_RED)❌ Failed to check outdated dependencies$(COLOR_RESET)" && exit 1)

deps-doctor:
	@echo "🏥 Running Flutter doctor..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) doctor -v || \
		(echo "$(COLOR_RED)❌ Flutter doctor check failed$(COLOR_RESET)" && exit 1)

deps-clean-cache:
	@echo "🧹 Cleaning pub cache..."
	@rm -rf $(PUB_CACHE_DIR)
	@echo "✨ Pub cache cleaned successfully!"

# Complete dependencies management
dependencies: check-environment deps-clean-cache deps-get deps-doctor
	@echo "✨ Dependencies setup completed successfully!"

upgrade: deps-clean-cache deps-upgrade deps-outdated deps-doctor
	@echo "✨ Dependencies upgrade completed successfully!"

# Code quality and formatting
format-dart:
	@echo "✨ Formatting Dart files..."
	@cd $(PROJECT_ROOT) && $(DART_CMD) format $(LIB_DIR) $(TEST_DIR) || \
		(echo "$(COLOR_RED)❌ Dart formatting failed$(COLOR_RESET)" && exit 1)

format-check:
	@echo "🔍 Checking Dart formatting..."
	@cd $(PROJECT_ROOT) && $(DART_CMD) format --set-exit-if-changed $(LIB_DIR) $(TEST_DIR) || \
		(echo "$(COLOR_RED)❌ Format check failed. Run 'make format' to fix$(COLOR_RESET)" && exit 1)

lint:
	@echo "🔍 Running dart analyze..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) analyze $(LIB_DIR) $(TEST_DIR) || \
		(echo "$(COLOR_RED)❌ Lint check failed$(COLOR_RESET)" && exit 1)

custom-lint:
	@echo "🔍 Running custom lint..."
	@cd $(PROJECT_ROOT) && $(CUSTOM_LINT_CMD) || \
		(echo "$(COLOR_RED)❌ Custom lint failed$(COLOR_RESET)" && exit 1)

format: format-dart
	@echo "✨ Code formatting completed successfully!"

check: format-check lint custom-lint
	@echo "✨ All code quality checks passed successfully!"

# Build targets
build-apk:
	$(call check_environment)
	@echo "📱 Building Android APK..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) build apk --release || \
		(echo "$(COLOR_RED)❌ APK build failed$(COLOR_RESET)" && exit 1)

build-ios:
	$(call check_environment)
	@echo "🍎 Building iOS..."
	@cd $(PROJECT_ROOT) && $(FLUTTER_CMD) build ios --release || \
		(echo "$(COLOR_RED)❌ iOS build failed$(COLOR_RESET)" && exit 1)

build: check-environment build-apk build-ios
	@echo "✨ All builds completed successfully!"