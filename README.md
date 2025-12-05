# Dealing with the Second Hardest Thing in Computer Science

This presentation summarizes my understanding of best practices in naming things for software development.

The title is inspired by the following quote:

> "There are only two hard things in Computer Science: cache invalidation and naming things."</br>
> \- Phil Karlton

The slides can be seen here:<br>
<https://indrajeetpatil.github.io/second-hardest-cs-thing/>

<a href="https://indrajeetpatil.github.io/second-hardest-cs-thing/" target="_blank">
<img src="media/cat.png" alt="introductory slide" width="400"/>
</a>

# Development

This project uses Python 3.13+ with [uv](https://docs.astral.sh/uv/) for dependency management, [Quarto](https://quarto.org/) for rendering slides, and [just](https://github.com/casey/just) as a command runner.

## Prerequisites

```bash
# Install just (macOS)
brew install just
```

## Setup

```bash
# Install dependencies
just install

# Or update to latest versions
just update
```

## Common Commands

```bash
just help      # Show all available commands
just render    # Render slides to HTML
just preview   # Live preview with auto-reload
just open      # Open rendered slides in browser
just clean     # Remove generated files
just check     # Check Quarto and Python setup
just           # Install, render, and open slides (default)
```

# Feedback

I'd love to hear thoughts and comments [here](https://github.com/IndrajeetPatil/second-hardest-cs-thing/issues).

# Code of Conduct

Please note that the second-hardest-cs-thing project is released with a [Contributor Code of Conduct](https://www.contributor-covenant.org/version/3/0/code_of_conduct/). By contributing to this project, you agree to abide by its terms.
