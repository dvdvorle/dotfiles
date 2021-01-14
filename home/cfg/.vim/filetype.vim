" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.adm      setfiletype adm
  au! BufRead,BufNewFile *.xaml		setfiletype xaml
  au! BufRead,BufNewFile *.ps1		setfiletype ps1
  au! BufRead,BufNewFile *.hta      setfiletype html
augroup END

if did_filetype()
  finish
endif

