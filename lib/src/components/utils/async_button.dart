import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AsyncButton extends HookWidget {
  final Function operation;
  final Widget child;

  AsyncButton({
    required this.operation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    perform() async {
      try {
        await operation();
      } catch (e) {}
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(
        child: child,
        onPressed: perform,
      ),
    );
  }
}
