# Default recipe - install, render, and open slides
default: install render open

# Show help
help:
    @echo "Available recipes:"
    @echo "  just install       - Install Quarto extensions and Python dependencies"
    @echo "  just sync          - Alias for install"
    @echo "  just update        - Update all dependencies (Quarto extensions and Python packages)"
    @echo "  just render        - Render the Quarto slides to HTML"
    @echo "  just preview       - Start Quarto preview with live reload"
    @echo "  just open          - Open rendered slides in default browser"
    @echo "  just clean         - Remove generated files and caches"
    @echo "  just check         - Check Quarto and Python setup"
    @echo "  just (default)     - Install dependencies, render, and open slides"

# Install/sync dependencies
install:
    @echo "Installing Quarto extensions..."
    quarto install extension quarto-ext/fontawesome --no-prompt
    @echo "Installing Python dependencies..."
    uv sync --no-install-project
    @echo "Installation complete"

# Alias for install
alias sync := install

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
    QUARTO_PYTHON=.venv/bin/python quarto render index.qmd

# Preview with live reload
preview:
    QUARTO_PYTHON=.venv/bin/python quarto preview index.qmd

# Open rendered slides in browser (macOS)
open:
    open _site/index.html

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
    QUARTO_PYTHON=.venv/bin/python quarto check
