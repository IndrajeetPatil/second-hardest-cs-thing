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
    #!/usr/bin/env bash
    set -euo pipefail
    uv sync --no-install-project
    # a11y 0.2.3: keep the commit and archive checksum aligned with CI.
    a11y_commit=0ae858c05f6108558d7bd5204a3dbb540dc8f5e6
    a11y_sha256=b119ec845f942b8e9e61a9c596dfde7a644baa59c8e0ec29257706aa969e07db
    archive_dir="$(mktemp -d)"
    trap 'rm -rf "$archive_dir"' EXIT
    curl --fail --location --silent --show-error \
      "https://github.com/mcanouil/quarto-revealjs-a11y/archive/${a11y_commit}.tar.gz" \
      --output "$archive_dir/a11y.tar.gz"
    echo "${a11y_sha256}  $archive_dir/a11y.tar.gz" | shasum -a 256 --check
    quarto add "$archive_dir/a11y.tar.gz" --no-prompt
    if [ -d _extensions/mcanouil/a11y ]; then
      quarto remove mcanouil/a11y --no-prompt
    fi

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
