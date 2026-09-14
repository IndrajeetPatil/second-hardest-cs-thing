# Dealing with the Second Hardest Thing in Computer Science

This presentation summarizes my understanding of best practices in naming things for software development.

The title is inspired by the following quote:

> "There are only two hard things in Computer Science: cache invalidation and naming things."</br>
> \- Phil Karlton

The slides can be seen here:<br>
<https://www.indrapatil.com/second-hardest-cs-thing/>

<a href="https://www.indrapatil.com/second-hardest-cs-thing/" target="_blank" rel="noopener noreferrer">
<img src="media/cat.webp" alt="introductory slide" width="400"/>
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
just install  # Install Python dependencies and the a11y extension
just update   # Update Python dependencies
just render   # Render slides to HTML
just preview  # Start a live preview with auto-reload
just open     # Alias for preview (live-reload dev server over localhost)
just clean    # Remove generated files and caches
just check    # Check the Quarto and Python setup
just          # Install dependencies and start live-reload preview
```

### Accessibility

`just install` and the shared CI workflow install
[`quarto-revealjs-a11y` 0.2.3](https://github.com/mcanouil/quarto-revealjs-a11y/releases/tag/0.2.3).
Both download a commit-addressed archive and verify its SHA-256 before installing
it. The commit and checksum in `justfile` must match the shared workflow. Local
installation also removes the older namespaced copy to prevent duplicate plugins.
The extension handles browser zoom, slide isolation, focus indicators, link
underlines, reduced motion, and screen-reader announcements. Run `just install`
again after `just clean`, which removes installed extensions.

The `accessibility.html` helper still handles scrollable code, slide-menu focus,
and vertical-slide semantics. Unused tabset handling has been removed. The
extension's slide-menu patch and accessibility settings panel are disabled:
version 0.2.3 introduces ARIA and contrast failures in those components.

Use `just axe` to preview with the accessibility report. Check slides, fragments,
and the menu in presentation and scroll views; the initial report does
not exercise every state. Normal builds omit the axe checker.

## Feedback

Feedback and suggestions are welcome in [the issue tracker](https://github.com/IndrajeetPatil/second-hardest-cs-thing/issues).
