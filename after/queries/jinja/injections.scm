;; extends

; Highlight the raw text between jinja tags as SQL (for dbt models).
; injection.combined stitches all content nodes into one SQL parse, so
; statements interrupted by {% ... %} blocks still parse as a unit.
((content) @injection.content
  (#set! injection.language "sql")
  (#set! injection.combined))
