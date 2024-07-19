"if" @keyword
"return" @keyword
"else" @keyword
"for" @keyword
"while" @keyword
"using" @keyword
"struct" @type

;(string_literal) @string
(_type) @type
(number) @number
(function_definition name: (identifier) @function)
;(struct_decl name: (identifier) @type.user)
;(constant_value_definition name: (identifier) @constant)
(comment) @comment
;(block_comment) @comment
;(cast_expression name: (identifier) @function)
;(function_call name: (variable_reference) @function)
(variable_definition name: (identifier) @variable)
(variable_definition names: (identifier) @variable)
;(implicit_variable_decl name: (identifier) @variable)
(parameter_list name: (identifier) @variable)
;(for_loop name: (identifier) @variable)
;(for_loop names: (identifier) @variable)