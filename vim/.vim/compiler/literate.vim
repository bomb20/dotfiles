if exists("current_compiler")
  finish
endif

let current_compiler = "literate"
setlocal makeprg=lit\ --compiler\ %
setlocal errorformat=%f:%l:%m:
