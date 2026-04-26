# Dealing with the Second Hardest Thing in Computer Science

This presentation summarizes my understanding of best practices in naming things for software development.

The title is inspired by the following quote:

> "There are only two hard things in Computer Science: cache invalidation and naming things."</br>
> \- Phil Karlton

The slides can be seen here:<br>
<https://www.indrapatil.com/second-hardest-cs-thing/>

<a href="https://www.indrapatil.com/second-hardest-cs-thing/" target="_blank" rel="noopener noreferrer">
<img src="media/cat.png" alt="introductory slide" width="400"/>
</a>

## Development

This project uses Python 3.14 (see `.python-version`) with [uv](https://docs.astral.sh/uv/) for dependency management, [Quarto](https://quarto.org/) for rendering slides, and [just](https://github.com/casey/just) as a command runner.

### Prerequisites

```bash
# Install just (macOS)
brew install just
```

### Setup

```bash
just install
```

### Just Commands

```bash
just help     # Show all available commands
just install  # Install Quarto extensions and Python dependencies
just update   # Update Quarto extensions and Python dependencies
just render   # Render slides to HTML
just preview  # Start a live preview with auto-reload
just open     # Open rendered slides in the default browser
just clean    # Remove generated files and caches
just check    # Check the Quarto and Python setup
just          # Install dependencies, render, and open slides
```

## Feedback

Feedback and suggestions are welcome in [the issue tracker](https://github.com/IndrajeetPatil/second-hardest-cs-thing/issues).
