import 'package:flutter/material.dart';

/// Wraps the [child] with a [Scaffold] and [ScaffoldMessenger] to show
/// [SnackBar]s from anywhere in the app using the [globalKey].
class GlobalMessage extends StatefulWidget {
  GlobalMessage({
    required this.child,
  }) : super(key: globalKey);

  final Widget child;

  static final GlobalKey<GlobalMessageState> globalKey =
      GlobalKey<GlobalMessageState>();

  @override
  GlobalMessageState createState() => GlobalMessageState();
}

class GlobalMessageState extends State<GlobalMessage> {
  final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void show(String message, [SnackBarAction? action]) {
    _messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
      ),
    );
  }

  void hideCurrent() {
    _messengerKey.currentState?.hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _messengerKey,
      child: Scaffold(
        body: widget.child,
      ),
    );
  }
}
