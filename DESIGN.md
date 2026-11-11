---
version: alpha
name: Dealing with the Second Hardest Thing in Computer Science
description: >-
  Clean, high-readability presentation design built on RevealJS simple:
  crisp white canvas, high-contrast dark typography, semantic pastels for
  good/bad naming contrasts, line-highlighted code blocks, and SVG icons.
colors:
  primary: "#1a1a1a"
  canvas: "#ffffff"
  text: "#222222"
  muted: "#666666"
  card-blue: "#e3f2fd"
  card-green: "#e8f5e9"
  card-amber: "#fff3e0"
  card-yellow: "#FFFBC1"
  card-red: "#ffebee"
  card-purple: "#f3e5f5"
  card-neutral: "#f8f9fa"
  highlight-line: "#fff8e1"
typography:
  display:
    fontFamily: Helvetica Neue, Helvetica, Arial, sans-serif
    fontSize: 2.1em
    fontWeight: 700
  heading:
    fontFamily: Helvetica Neue, Helvetica, Arial, sans-serif
    fontSize: 1.4em
    fontWeight: 700
  body:
    fontFamily: Helvetica Neue, Helvetica, Arial, sans-serif
    fontSize: 32px
    fontWeight: 400
  mono:
    fontFamily: monospace
rounded:
  sm: 4px
  md: 8px
components:
  page:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.text}"
  code-highlight:
    backgroundColor: "{colors.highlight-line}"
---

# DESIGN.md

The visual design specification of the Dealing with the Second Hardest Thing in Computer Science presentation deck.

## Overview

The visual design follows a clean, editorial layout built on Quarto's RevealJS `simple` theme. It prioritises high legibility and clear contrast to present naming conventions and code examples: a crisp white canvas, dark neutral text, semantic pastel containers for good vs. bad naming contrasts, highlighted code lines, and crisp SVG icons.

The theme format is Quarto RevealJS (`theme: simple`). Custom styles are defined in `style.css` and mirrored in the front matter above.

## Colours

- **Canvas & Typography:**
  - `canvas` (`#ffffff`): Clean white backdrop for maximum readability.
  - `text` (`#222222`): High-contrast dark grey body text and headings.
  - `muted` (`#666666`): Footers and citations.
- **Semantic Callout & Card Colours:**
  - `card-green` (`#e8f5e9`, `#c8e6c9`): Recommended naming patterns and clear examples.
  - `card-red` (`#ffebee`, `#ffcdd2`): Anti-patterns, misleading names, and warnings.
  - `card-blue` (`#e3f2fd`): Conceptual definitions, principles, and tools.
  - `card-amber` / `card-yellow` (`#fff3e0`, `#FFFBC1`): Rules of thumb and cautionary guidance.
  - `card-purple` (`#f3e5f5`): Case studies and naming strategies.
  - `card-neutral` (`#f8f9fa`): Metadata and code notes.
- **Code Highlights:**
  - `highlight-line` (`#fff8e1`): Warm highlight for specific lines of interest in code blocks.

## Typography

- **Headings & Body:** Default clean sans-serif stack (`Helvetica Neue`, `Helvetica`, `Arial`, `sans-serif`).
- **Code:** Monospace stack for variable and function names, code blocks, and syntax examples. Code blocks within callouts have enlarged font size for legibility.

## Layout & Components

- **Assistive Headings:** `.sr-only-heading > h2` hides headings visually on dense slides while retaining accessibility semantics.
- **Line Highlights:** `div.sourceCode pre code.has-line-highlights` preserves unhighlighted lines at full opacity while highlighting selected spans in warm amber (`#fff8e1`).
- **Icons:** SVG mask icons (`.deck-icon`, `.deck-icon-brands-github`, `.deck-icon-brands-linkedin`, `.deck-icon-solid-envelope`) rendered via CSS masks in `currentColor`.
- **Mermaid Diagrams:** Dark edge labels (`#1a1a1a`) ensuring contrast against grey backings.

## Do's and Don'ts

- **Do** reuse the established semantic pastel colours for cards and callouts.
- **Do** format code identifiers with backticks and display code with clear language tags.
- **Don't** introduce ad-hoc bright saturated background colours.
- **Don't** use inline style rules that break contrast against the white canvas.
