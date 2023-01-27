require('git-blame-line').setup {
  git = {
    default_message = 'Not commited yet',
    blame_format = '%an - %ar - %s'
  },
  view = {
    left_padding_size = 5,
    enable_cursor_hold = true
  }
}

