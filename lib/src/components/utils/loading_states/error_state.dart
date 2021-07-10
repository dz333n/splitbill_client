import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorState extends StatelessWidget {
  final StackTrace? stackTrace;
  final Object error;

  ErrorState({required this.error, this.stackTrace}) {
    print(this.error.toString());
    print(this.stackTrace.toString());
  }

  static ErrorState forAsyncValue(Object error, StackTrace? stackTrace) {
    return ErrorState(error: error, stackTrace: stackTrace);
  }

  @override
  Widget build(BuildContext context) {
    buildCentered(children) {
      return SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      );
    }

    List<Widget> widgets = [Text('Oops, an error occurred')];

    if (kDebugMode) {
      widgets.add(Text('\n${error.toString()}'));

      widgets.addAll([
        SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () => Clipboard.setData(
            ClipboardData(
              text: error.toString() + '\n\n' + stackTrace.toString(),
            ),
          ),
          icon: Icon(Icons.copy),
          label: Text('Copy'),
        ),
        SizedBox(height: 8),
      ]);

      if (stackTrace != null) {
        widgets.add(Text('\n${stackTrace.toString()}'));
      }
    }

    return buildCentered(widgets);
  }
}
