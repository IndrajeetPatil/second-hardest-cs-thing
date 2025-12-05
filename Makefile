.PHONY: help install sync update render preview open clean check all

# Default target
all: install render open

# Show help
help:
	@echo "Available targets:"
	@echo "  make install       - Install Quarto extensions and Python dependencies"
	@echo "  make sync          - Alias for install"
	@echo "  make update        - Update all dependencies (Quarto extensions and Python packages)"
	@echo "  make render        - Render the Quarto slides to HTML"
	@echo "  make preview       - Start Quarto preview with live reload"
	@echo "  make open          - Open rendered slides in default browser"
	@echo "  make clean         - Remove generated files and caches"
	@echo "  make check         - Check Quarto and Python setup"
	@echo "  make all           - Install dependencies, render, and open slides"

# Install/sync dependencies
install:
	@echo "Installing Quarto extensions..."
	quarto install extension quarto-ext/fontawesome --no-prompt
	@echo "Installing Python dependencies..."
	uv sync --no-install-project
	@echo "Installation complete"

sync: install

# Update all dependencies
update:
	@echo "Updating Quarto extensions..."
	quarto update extension quarto-ext/fontawesome
	@echo "Updating Python dependencies..."
	uv lock --upgrade
	uv sync --no-install-project
	@echo "All dependencies updated!"

# Render slides
render:
	uv run --no-project quarto render index.qmd

# Preview with live reload
preview:
	uv run --no-project quarto preview index.qmd

# Open rendered slides in browser (macOS)
open:
	open index.html

# Clean generated files
clean:
	rm -rf .quarto/
	rm -rf _site/
	rm -rf _extensions/
	rm -f index.html
	rm -rf index_files/
	rm -rf .ipynb_checkpoints/

# Check Quarto setup
check:
	uv run --no-project quarto check
