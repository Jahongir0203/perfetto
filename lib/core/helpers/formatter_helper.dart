import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormatterHelpers {
  static final phoneFormatter = MaskTextInputFormatter(
      mask: '+998 ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
