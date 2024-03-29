[
  (comment)
  (pragma)
] @comment

[
  (self)
  (super)
] @variable.builtin

[
  (getter)
  (setter)
  (nonnull)
  (nullable)
  (null_resettable)
  (unsafe_unretained)
  (null_unspecified)
  (direct)
  (readwrite)
  (readonly)
  (strong)
  (weak)
  (copy)
  (assign)
  (retain)
  (atomic)
  (nonatomic)
  (class)
  (NS_NONATOMIC_IOSONLY)
  (DISPATCH_QUEUE_REFERENCE_TYPE)
] @keyword

[
  "@interface"
  "@protocol"
  "@property"
  "@end"
  "@implementation"
  "@compatibility_alias"
  "@autoreleasepool"
  "@synchronized"
  "@class"
  "@synthesize"
  "@dynamic"
  "@defs"
  "@try"
  "@catch"
  "@finally"
  "@throw"
  "@selector"
  "@encode"
  (private)
  (public)
  (protected)
  (package)
  (optional)
  (required)
  "NS_ENUM"
  "NS_ERROR_ENUM"
  "NS_OPTIONS"
  "NS_SWIFT_NAME"
  (type_qualifier)
  (storage_class_specifier)
  "NS_NOESCAPE"
  "const"
  "default"
  "enum"
  "extern"
  "inline"
  "static"
  "struct"
  "typedef"
  "typeof"
  "__typeof"
  "__typeof__"
  "_Atomic"
  "union"
  "volatile"
  "goto"
  "register"
  "__covariant"
  "__contravariant"
  "__GENERICS"
] @keyword

"sizeof" @keyword.operator
"return" @keyword.control.return

[
  "while"
  "for"
  "do"
  "continue"
  "break"
] @keyword.control.repeat

[
  "#define"
  "#if"
  "#ifdef"
  "#ifndef"
  "#else"
  "#elif"
  "#endif"
  "#include"
  "#import"
  "@import"
  (preproc_directive)
] @keyword.directive

[
  "="

  "-"
  "*"
  "/"
  "+"
  "%"

  "~"
  "|"
  "&"
  "^"
  "<<"
  ">>"

  "->"

  "<"
  "<="
  ">="
  ">"
  "=="
  "!="

  "!"
  "&&"
  "||"

  "-="
  "+="
  "*="
  "/="
  "%="
  "|="
  "&="
  "^="
  ">>="
  "<<="
  "--"
  "++"
  "@"
] @operator

[
 "if"
 "else"
 "case"
 "switch"
] @keyword.control.conditional

(conditional_expression [ "?" ":" ] @keyword.control.conditional)

[
 (true)
 (false)
 (YES)
 (NO)
] @constant.builtin.boolean

["." ";" ":" ","] @punctuation.delimiter

"..." @punctuation.special

["(" ")" "[" "]" "{" "}"] @punctuation.bracket

[
  (string_literal)
  (string_expression)
  (system_lib_string)
  (module_string)
] @string

(escape_sequence) @constant.character.escape

(null) @constant.builtin
(nil) @constant.builtin
(number_literal) @constant.numeric
(number_expression) @constant.numeric
(char_literal) @constant.character.escape

[
 (preproc_arg)
 (preproc_defined)
] @function.macro

[
 (type_identifier)
 (primitive_type)
 (sized_type_specifier)
 (type_descriptor)
 (generics_type_reference)
] @type

[
 (id)
 (Class)
 (Method)
 (IMP)
 (SEL)
 (BOOL)
 (instancetype)
 (auto)
] @type.builtin

(declaration (type_qualifier) @type)
(cast_expression type: (type_descriptor) @type)
(sizeof_expression value: (parenthesized_expression (identifier) @type))

; Class, category, and protocol

(class_interface name: (identifier) @type)
(category_interface name: (identifier) @type)
(category_interface category: (identifier) @type)
(superclass_reference name: (identifier) @type)
(parameterized_class_type_arguments) @types
(class_implementation name: (identifier) @type)
(category_implementation name: (identifier) @type)
(compatibility_alias_declaration (identifier) @type)
(parameterized_class_type_arguments (identifier) @type)
(category_implementation category: (identifier) @type)
(class_forward_declaration name: (identifier) @type)
(protocol_forward_declaration name: (identifier) @type)
(protocol_declaration name: (identifier) @type)
(protocol_qualifiers name: (identifier) @type)
(protocol_expression (identifier) @type)

; Preproc def and undef

(preproc_def
  name: (_) @constant)

(preproc_call
  directive: (preproc_directive) @_u
  argument: (_) @constant
  (#eq? @_u "#undef"))

; Property

(property_declaration
  type: _ @type
  declarator: (identifier) @property)

(property_declaration
  type: _ @type
  declarator: (_
    declarator: (identifier) @property))

(property_declaration
  type: _ @type
  declarator: (_
    declarator: (_
      declarator: (identifier) @property)))

(((field_expression
 (field_identifier) @property)) @_parent
 (#not-has-parent? @_parent function_declarator call_expression))

(field_expression
  field: (field_identifier) @property)

(((field_identifier) @property)
 (#has-ancestor? @property field_declaration)
 (#not-has-ancestor? @property function_declarator))

; Variable

declarator: (identifier) @variable

(cast_expression value: (identifier) @variable)

; Function

(call_expression
  function: (identifier) @function)
(function_declarator
  declarator: (identifier) @function)
(preproc_function_def
  name: (identifier) @function.macro)
(selector_expression
  name: (identifier) @function)
(method_declaration
  selector: (identifier) @function)

(method_declaration
  (keyword_selector
    (keyword_declarator
      keyword: (identifier) @function)))

(method_declaration
  (keyword_selector
    (keyword_declarator
      name: (identifier) @variable.parameter)))

(message_expression
  receiver: (field_expression
    field: (field_identifier) @function))

(method_definition
  selector: (identifier) @function)

(swift_name_attribute_sepcifier
  method: (identifier) @function)

(setter
  name: (identifier) @function)

(method_definition
  (keyword_selector
    (keyword_declarator
      keyword: (identifier) @function)))

(message_expression
  selector: (identifier) @function)

(method_definition
  (keyword_selector
    (keyword_declarator
      name: (identifier) @variable.parameter)))

(message_expression
  selector: (keyword_argument_list
    (keyword_argument
      keyword: (identifier) @function)))

(message_expression
  selector: (keyword_argument_list
    (keyword_argument
      argument: (identifier) @variable.parameter)))

(unary_expression argument: (identifier) @function)
(va_arg_expression) @function
(va_arg_expression va_list: (identifier) @variable)
(enumerator name: (identifier) @variable)

; Parameters

(parameter_declaration
  declarator: (identifier) @variable.parameter)

(parameter_declaration
  declarator: (pointer_declarator) @variable.parameter)

(parameter_declaration
  declarator: (pointer_declarator
    declarator: (identifier) @variable.parameter))

(for_in_statement
  loop: (identifier) @variable)

(dictionary_expression
  key: (_expression) @variable)
(dictionary_expression
  value: (_expression) @variable)
(array_expression
  (identifier) @variable)
(argument_list
  (identifier) @variable)
(expression_statement
  (identifier) @variable)
(_expression (identifier) @variable)

[
  "__attribute"
  "__attribute__"
  "__cdecl"
  "__clrcall"
  "__stdcall"
  "__fastcall"
  "__thiscall"
  "__vectorcall"
  "_unaligned"
  "__unaligned"
  "__declspec"
  "__unused"
  "__builtin_available"
  "@available"
  (attribute_specifier)
  (class_interface_attribute_sepcifier)
  (method_variadic_arguments_attribute_specifier)
] @attribute

(attribute_specifier) @attribute

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z0-9_$]+$"))
