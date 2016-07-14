module.exports =

    ##  See: http://www.coffeelint.org/#options
    ##
    ##  -------------------------------+-------+-------+--------
    ##  level:                         | error | warn  | ignore
    ##  -------------------------------+-------+-------+--------

    ##
    arrow_spacing:
        level:                          'error'

    braces_spacing:
        level:                                          'ignore'
        empty_object_spaces:                            0
        spaces:                                         1

    camel_case_classes:
        level:                          'error'

    coffeescript_error:
        level:                          'error'

    colon_assignment_spacing:
        level:                                          'ignore'
        spacing:
            left:                                           0
            right:                                          0

    cyclomatic_complexity:
        level:                                  'warn'
        value:                                  11

    duplicate_key:
        level:                          'error'

    empty_constructor_needs_parens:
        level:                          'error'

    ensure_comprehensions:
        level:                          'error'

    eol_last:
        level:                          'error'

    indentation:
        level:                          'error'
        value:                          4

    line_endings:
        level:                          'error'
        value:                          'unix'

    max_line_length:
        level:                                  'warn'
        limitComments:                          true
        value:                                  160

    missing_fat_arrows:
        is_strict:                                      false
        level:                                          'ignore'

    newlines_after_classes:
        level:                                          'ignore'
        value:                                          3

    no_backticks:
        level:                          'error'

    no_debugger:
        console:                                false
        level:                                  'warn'

    no_empty_functions:
        level:                          'error'

    no_empty_param_list:
        level:                                          'ignore'

    no_implicit_braces:
        level:                                          'ignore'
        strict:                                         false

    no_implicit_parens:
        level:                          'error'
        strict:                         true

    no_interpolation_in_single_quotes:
        level:                          'error'

    no_nested_string_interpolation:
            level:                              'warn'

    no_plusplus:
        level:                                          'ignore'

    no_private_functions_fat_arrows:
        level:                          'error'

    no_stand_alone_at:
        level:                                          'ignore'

    no_tabs:
        level:                          'error'

    no_this:
        level:                                          'ignore'

    no_throwing_strings:
        level:                          'error'

    no_trailing_semicolons:
        level:                          'error'

    no_trailing_whitespace:
        allowed_in_comments:            false
        allowed_in_empty_lines:         false
        level:                          'error'

    no_unnecessary_double_quotes:
        level:                          'error'

    no_unnecessary_fat_arrows:
        level:                          'error'

    non_empty_constructor_needs_parens:
        level:                          'error'

    prefer_english_operator:
        doubleNotLevel:                                 'ignore'
        level:                          'error'

    space_operators:
        level:                          'error'

    spacing_after_comma:
        level:                          'error'

    transform_messes_up_line_numbers:
        level:                                  'warn'
