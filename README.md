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

This project uses Python 3.13+ with [uv](https://docs.astral.sh/uv/) for dependency management and [Quarto](https://quarto.org/) for rendering slides.

## Setup

```bash
# Install dependencies
make install

# Or update to latest versions
make update
```

## Common Commands

```bash
make help      # Show all available commands
make render    # Render slides to HTML
make preview   # Live preview with auto-reload
make open      # Open rendered slides in browser
make clean     # Remove generated files
make check     # Check Quarto and Python setup
make all       # Install, render, and open slides
```

# Feedback

I'd love to hear thoughts and comments [here](https://github.com/IndrajeetPatil/second-hardest-cs-thing/issues).

# Code of Conduct

Please note that the second-hardest-cs-thing project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
