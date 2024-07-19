; Preprocs

[
  (calling_convention)
  (tag)
] @keyword.directive

; Includes

[
  "#import"
  "#load"
] @keyword.import

; Keywords

[
  "break"
  "case"
  "cast"
  "code_of"
  "continue"
  "defer"
  "else"
  "enum"
  "enum_flags"
  "for"
  "initializer_of"
  "if"
  "ifx"
  "is_constant"
  "inline"
  "push_context"
  "return"
  "size_of"
  "struct"
  "then"
  "type_info"
  "type_of"
  "union"
  "using"
  "while"
  "xx"
  "operator"
  "remove"
  "interface"
  "no_inline"
] @keyword

;[
;  "proc"
;] @keyword.function

[
  "return"
] @keyword.return

[
  "distinct"
  "dynamic"
] @keyword.storage

; Conditionals

[
  "if"
  "else"
  "when"
  "switch"
  "case"
  "where"
  "break"
  (fallthrough_statement)
] @keyword.conditional

((ternary_expression
  [
    "?"
    ":"
    "if"
    "else"
    "when"
  ] @keyword.conditional.ternary)
  (#set! "priority" 105))

; Repeats

[
  "for"
  "do"
  "continue"
] @keyword.repeat

; Variables

(identifier) @variable

; Namespaces

(package_declaration (identifier) @module)

(import_declaration alias: (identifier) @module)

(foreign_block (identifier) @module)

(using_statement (identifier) @module)

; Parameters

(parameter (identifier) @variable.parameter ":" "="? (identifier)? @constant)

(default_parameter (identifier) @variable.parameter ":=")

(named_type (identifier) @variable.parameter)

(call_expression argument: (identifier) @variable.parameter "=")

; Functions

(procedure_declaration (identifier) @type)

(procedure_declaration (identifier) @function (procedure (block)))

(procedure_declaration (identifier) @function (procedure (uninitialized)))

(overloaded_procedure_declaration (identifier) @function)

(call_expression function: (identifier) @function.call)

; Constants

(const_declaration (identifier) @constant "::")

(member_expression . "." (identifier) @constant)

(enum_declaration "{" (identifier) @constant)

; Types

(type (identifier) @type)

((type (identifier) @type.builtin)
  (#any-of? @type.builtin
    "__reg" "bool" "float" "float32" "float64"
	"int" "reg" "s16" "s32" "s64" "s8"
	"string" "u16" "u32" "u64" "u8" "void" "v128" "Any" "Code" "Type"))

"..." @type.builtin

(struct_declaration (identifier) @type "::")

(enum_declaration (identifier) @type "::")

(union_declaration (identifier) @type "::")

(bit_field_declaration (identifier) @type "::")

(const_declaration (identifier) @type "::" [(array_type) (distinct_type) (bit_set_type) (pointer_type)])

(struct . (identifier) @type)

(field_type . (identifier) @module "." (identifier) @type)

(bit_set_type (identifier) @type ";")

(procedure_type (parameters (parameter (identifier) @type)))

(polymorphic_parameters (identifier) @type)

; Fields

(member_expression "." (identifier) @variable.member)

(struct_type "{" (identifier) @variable.member)

(struct_field (identifier) @variable.member "="?)

(field (identifier) @variable.member)

; Macros

((call_expression function: (identifier) @function.macro)
  (#lua-match? @function.macro "^_*[A-Z][A-Z0-9_]*$"))

; Attributes

(attribute (identifier) @attribute "="?)

; Labels

(label_statement (identifier) @label ":")

; Literals

(number) @number

(float) @number.float

(string) @string

(character) @character

(escape_sequence) @string.escape

(boolean) @boolean

[
  (uninitialized)
  (nil)
] @constant.builtin

((identifier) @variable.builtin
  (#any-of? @variable.builtin "context"))

; Operators

[
  ":="
  "="
  "+"
  "-"
  "*"
  "/"
  "%"
  "%%"
  ">"
  ">="
  "<"
  "<="
  "=="
  "!="
  "~="
  "|"
  "~"
  "&"
  "&~"
  "<<"
  ">>"
  "||"
  "&&"
  "!"
  "^"
  ".."
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "<<="
  ">>="
  "||="
  "&&="
  "&~="
  "..="
  "..<"
  "?"
] @operator

[
  "or_else"
  "in"
  "not_in"
] @keyword.operator

; Punctuation

[ "{" "}" ] @punctuation.bracket

[ "(" ")" ] @punctuation.bracket

[ "[" "]" ] @punctuation.bracket

[
  "::"
  "->"
  "."
  ","
  ":"
  ";"
] @punctuation


[
  "@"
  "$"
] @punctuation.special

; Comments

[
  (comment)
  (block_comment)
] @comment

; Errors

(ERROR) @error