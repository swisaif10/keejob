import 'package:logging/logging.dart';

mixin BirthdyLogger {
  Logger get log => Logger('$runtimeType');
}
