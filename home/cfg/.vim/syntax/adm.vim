if exists("b:current_syntax")
  finish
endif

" Comments and special comment words
syn keyword admCommentTodo TODO FIXME XXX TBD HACK contained
syn match admComment /;.*/ contains=admCommentTodo

" Language keywords and elements
syn match admScope /CLASS \w*\|\[strings\]/
syn keyword admKeyword CATEGORY POLICY KEYNAME VALUENAME 
syn keyword admKeyword PART NUMERIC REQUIRED
syn match admKeyword /END \w*/
syn match admVariable /!!\w*\|\w*=/
syn region admString start=/"/ end=/"/ 

hi link admString String
hi link admConditional Conditional
hi link admFunction Function
hi link admVariable Identifier
hi link admScopedVariable Identifier
hi link admVariableName Identifier
hi link admType Type
hi link admScope Type
hi link admStandaloneType Type
hi link admNumber Number
hi link admComment Comment
hi link admCommentTodo Todo
hi link admOperator Operator
hi link admRepeat Repeat
hi link admRepeatAndCmdlet Repeat
hi link admKeyword Keyword
hi link admKeywordAndCmdlet Keyword
hi link admCmdlet Statement
hi link admConstant Constant

let b:current_syntax = "adm"
