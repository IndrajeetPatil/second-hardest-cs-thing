# Default recipe - install, render, and open slides
default: install preview

# Show help
help:
    @echo "Available recipes:"
    @echo "  just install       - Install Python dependencies and Quarto extensions"
    @echo "  just sync          - Alias for install"
    @echo "  just update        - Update Python dependencies"
    @echo "  just render        - Render the Quarto slides to HTML"
    @echo "  just preview       - Start Quarto preview with live reload"
    @echo "  just open          - Alias for preview (live-reload dev server)"
    @echo "  just clean         - Remove generated files and caches"
    @echo "  just check         - Check Quarto and Python setup"
    @echo "  just axe           - Preview with the axe accessibility checker enabled"
    @echo "  just (default)     - Install dependencies and start live-reload preview"

# Install/sync dependencies
install:
    uv sync --no-install-project
    quarto add mcanouil/quarto-revealjs-a11y --no-prompt

# Alias for install
alias sync := install

# Update all dependencies
update:
    @echo "Updating Python dependencies..."
    uv lock --upgrade
    uv sync --no-install-project
    @echo "All dependencies updated!"

# Render slides
render:
    uv run quarto render index.qmd

# Preview with live reload
preview:
    uv run quarto preview index.qmd

# Open rendered slides in browser (macOS)
alias open := preview

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
    uv run quarto check

# Audit accessibility with axe-core, appending a violations report slide to the deck.
# Uses the a11y profile because `-M axe:true` cannot override the format block in index.qmd.
[positional-arguments]
axe *args:
    QUARTO_PROFILE=a11y uv run quarto preview index.qmd "$@"
