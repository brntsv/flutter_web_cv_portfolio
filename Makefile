# Makefile
.PHONY: all clean clean-ios packages icons pub pod gen

# Цвета для вывода
RED := \033[31m
GREEN := \033[32m
YELLOW := \033[33m
BLUE := \033[34m
RESET := \033[0m

all: ## Показать справку по командам
	@echo "$(BLUE)Доступные команды для разработки$(RESET)"
	@echo ""
	@echo "$(YELLOW)📦 Зависимости$(RESET)"
	@awk 'BEGIN {FS = ":.*?## "} /^(clean|packages|pub|pod):.*?## / {printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(YELLOW)🎨 Кодогенерация$(RESET)"
	@awk 'BEGIN {FS = ":.*?## "} /^(icons|gen):.*?## / {printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(YELLOW)🧹 Очистка$(RESET)"
	@awk 'BEGIN {FS = ":.*?## "} /^clean-ios:.*?## / {printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# =============================================================================
# ЗАВИСИМОСТИ
# =============================================================================

clean: ## Pub get проекта
	@echo "$(YELLOW)🧹 Очищаем проект...$(RESET)"
	fvm flutter clean
	fvm flutter pub get
	@echo "$(GREEN)✅ Очистка завершена$(RESET)"

packages: ## Pub get для пакетов
	@echo "$(YELLOW)📦 Устанавливаем зависимости для пакетов...$(RESET)"
	fvm flutter pub get --directory packages/ui_kit
	fvm flutter pub get --directory packages/utilities
	@echo "$(GREEN)✅ Зависимости установлены$(RESET)"

pod: ## Pod install для iOS
	@echo "$(YELLOW)🍎 Устанавливаем pods для iOS...$(RESET)"
	cd ios && pod install
	@echo "$(GREEN)✅ Pods установлены$(RESET)"

pub: clean packages ## Pub get проекта + packages

# =============================================================================
# CODEGEN КОМАНДЫ
# =============================================================================

gen: ## Build runner
	@echo "$(YELLOW)🍺 Codegen...$(RESET)"
	fvm dart run build_runner build --delete-conflicting-outputs
	@echo "$(GREEN)✅ Codegen completed$(RESET)"

icons: ## Генерация иконок, цветов и шрифтов
	@echo "$(YELLOW)🎨 Генерируем иконки, цвета и шрифты...$(RESET)"
	fluttergen -c packages/ui_kit/pubspec.yaml
	@echo "$(GREEN)✅ Генерация завершена$(RESET)"

# =============================================================================
# CLEAN КОМАНДЫ
# =============================================================================

clean-ios: ## Глубокая очистка iOS проекта
	$(MAKE) clean
	@echo "$(YELLOW)🧹 Глубокая очистка iOS...$(RESET)"
	cd ios && \
		pod cache clean --all && \
		xcodebuild clean && \
		rm -rf .symlinks/ && \
		rm -rf Pods && \
		rm -rf Podfile.lock
	# @echo "$(BLUE)🗑️ Очистка DerivedData...$(RESET)"
	# rm -rf ~/Library/Developer/Xcode/DerivedData
	@echo "$(GREEN)✅ Очистка iOS завершена$(RESET)"

