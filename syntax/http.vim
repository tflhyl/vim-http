if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword httpMethod  OPTIONS GET HEAD POST PUT DELETE TRACE CONNECT PATCH contained

syn match httpProto         'HTTP/[0-9.]\+' contained
syn match httpStatusCode    '[0-9]\{3\}' contained
syn match httpStatus        '[0-9]\{3\} .*$' contained contains=httpStatusCode
syn match httpHeaderKey     '^[A-Z][A-Za-z0-9\-]*:' contained
syn match httpURILine       '^\(OPTIONS\|GET\|HEAD\|POST\|PUT\|DELETE\|TRACE\|CONNECT\|PATCH\)\( .*\)\?\(HTTP/[0-9.]\+\)\?$'  contains=httpMethod,httpProto
syn match httpResponseLine  '^HTTP/[0-9.]\+ [0-9]\{3\}.*$' contains=httpProto,httpStatus
syn match httpHeaderLine    '^[A-Z][A-Za-z0-9\-]*: .*$' contains=httpHeaderKey

hi link httpMethod      Macro
hi link httpProto       Statement
hi link httpHeaderKey   Identifier
hi link httpStatus      String
hi link httpStatusCode      Number

syn match jsonNumber '-\=\d\+\%(\.\d\+\)\=\([eE][-+]\=\d\+\)\='
syn region jsonString start=/"/ skip=/\\"/ end=/"/
syn match jsonKey '\v("([^"\\]|\\.)+")\s*:'hs=s,he=e-1
syn match jsonNull 'null\>'
syn match jsonBool 'true\>\|false\>'
highlight default link jsonNumber Number
highlight default link jsonString String
highlight default link jsonKey Type
highlight default link jsonNull Boolean
highlight default link jsonBool Boolean

let b:current_syntax = 'http'
