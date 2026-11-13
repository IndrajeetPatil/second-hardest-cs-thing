# AGENTS.md

A single-page [Quarto](https://quarto.org/) presentation rendered to
[RevealJS](https://revealjs.com/) slides and deployed as a static site via
GitHub Pages.

## Checks

`just render` must succeed after every change; CI builds the deck on every
pull request.

## Key conventions

- **Single-file deck.** All slides live in `index.qmd`; do not split it.
- **Design specification.** The visual design follows [DESIGN.md](DESIGN.md).
  Respect it when creating or modifying slides, components, styling, colours,
  and typography. Keep the theme `simple` and the format `revealjs`; restyle
  through `style.css`. Inline `style` backgrounds on fenced divs reuse colours
  already defined in `DESIGN.md` and `index.qmd`; do not invent new ones. New
  widgets follow the naming patterns already in `style.css`.
- **Sources.** Every factual claim has a source citation at the bottom of its
  slide in a small-font centred div. Keep this pattern.
- **Spelling and punctuation.** Use British spelling in prose (colour, licence,
  catalogue, artefact) and the Oxford comma in lists of three or more. Leave
  code, identifiers, file names, URLs, quotations, and proper names (such as
  `license` in YAML) as they are.
- **Spoken notes.** The read-aloud control speaks the `.notes` content. Write
  complete, audience-facing narration; keep staging cues, private reminders,
  and delivery checklists outside these blocks.
- **Accessibility.** Images must have `fig-alt` text; raw HTML widgets use
  `role="img"` and `aria-label`.
- **Icons.** Icons are HTML spans backed by only the required SVG path data in
  `style.css`; no icon font or Quarto icon extension. When adding one, add only
  its mask data, preserve the source licence attribution, and keep an
  accessible label where the icon conveys meaning.
- **No code execution.** The front matter sets `execute: echo: true` and
  `eval: false`; code blocks are display-only. Do not enable `eval: true`
  unless the deck genuinely needs computed output.
- **Mermaid.** Keep diagrams as Mermaid source; do not replace them with
  pre-rendered SVGs to shrink the bundle. Start every `{mermaid}` chunk with
  `%%| eval: true` and `%%| echo: false`: the document-level `execute` options
  apply to diagram chunks too, and without these overrides the diagram is
  suppressed and its source is printed instead.
- **Python dependencies.** The deck declares `jupyter: python3`; the virtualenv
  only satisfies Quarto's engine. Depend only on `ipykernel`, `nbclient` and
  `pyyaml`. Do not add the `jupyter` metapackage: it pulls in JupyterLab and
  Notebook and only attracts irrelevant security alerts.
- **Discoverability files.** Update `meta-tags.html` when the title,
  description, or social card changes, and `llms.txt` / `llms-full.txt` (and
  their `.well-known/` mirrors) when the content changes significantly.
- **No new top-level files** without a clear reason; the structure is flat.

## CI/CD

- `.github/workflows/build-presentation.yaml` calls a reusable workflow from
  `IndrajeetPatil/workflows`. Do not inline or modify that workflow here.
- Reference reusable workflows as `@main`, never a commit SHA: they are
  first-party, and a pinned SHA silently falls behind them.

## Agent skills

Skills live in `.agents/skills/<name>/SKILL.md`. Load one before its task:

| Skill | Load before |
| --- | --- |
| `check-accessibility` | Changing slide markup, styles, widgets, menus or the a11y setup; any accessibility audit |
