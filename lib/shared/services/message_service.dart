import 'package:flutter/material.dart';
import 'package:keejob_mobile/shared/global_message.dart';

class GlobalMessageService {
  GlobalMessageState? get messageState => GlobalMessage.globalKey.currentState;

  /// Shows a global [SnackBar] using the [GlobalMessage].
  void show(String message,
      [SnackBarAction? action, bool hideCurrentMsg = true]) {
    if (hideCurrentMsg) {
      hideCurrent();
    }
    return messageState?.show(message);
  }

  void hideCurrent() => messageState?.hideCurrent();
}
