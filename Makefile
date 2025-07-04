# Makefile
.PHONY: all clean packages icons pub gen deploy

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
	@awk 'BEGIN {FS = ":.*?## "} /^(clean|packages|pub):.*?## / {printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(YELLOW)🎨 Кодогенерация$(RESET)"
	@awk 'BEGIN {FS = ":.*?## "} /^(icons|gen):.*?## / {printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(YELLOW)🚀 Деплой$(RESET)"
	@awk 'BEGIN {FS = ":.*?## "} /^(deploy):.*?## / {printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2}' $(MAKEFILE_LIST)

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
	fvm flutter pub get --directory packages/utils
	@echo "$(GREEN)✅ Зависимости установлены$(RESET)"

pub: clean packages ## Pub get проекта + packages

# =============================================================================
# CODEGEN
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
# DEPLOY
# =============================================================================

deploy: ## Деплой проекта
	@echo "$(YELLOW)🚀 Деплой проекта...$(RESET)"
	fvm flutter build web --release
	firebase deploy --only hosting
	@echo "$(GREEN)✅ Деплой завершен$(RESET)"
