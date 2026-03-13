return {
  'tigion/nvim-asciidoc-preview',
  ft = { 'asciidoc' },
  build = 'cd server && npm install --omit=dev --no-save',
  ---@module 'asciidoc-preview'
  ---@type asciidoc-preview.Config
  opts = {
    -- Add user configuration here
  },
}
-- Command Description
-- :AsciiDocPreview: Starts the AsciiDoc preview server in background and opens the current AsciiDoc file in the standard web browser.
-- :AsciiDocPreviewStop: (if needed) Stops the AsciiDoc preview server.
-- :AsciiDocPreviewOpen: (if needed) (Re)Opens the current AsciiDoc file in the standard web browser.
-- :AsciiDocPreviewNotify: (if needed) Notifies the server to display the current AsciiDoc file in the preview.
