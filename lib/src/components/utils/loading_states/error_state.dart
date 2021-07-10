import 'package:flutter/material.dart';

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
    return Center(
      child: Text('Oops, an error occurred 🤔'),
    );
  }
}
