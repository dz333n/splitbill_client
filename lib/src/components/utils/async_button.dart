import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AsyncButton extends HookWidget {
  final Function operation;
  final Widget child;

  AsyncButton({@required this.operation, @required this.child});

  @override
  Widget build(BuildContext context) {
    final _btnController =
        useMemoized(() => RoundedLoadingButtonController(), []);
    final isMounted = useIsMounted();

    _addToCart() async {
      try {
        _btnController.start();

        await operation();

        if (isMounted()) {
          _btnController.success();
        }
      } catch (e) {
        if (isMounted()) {
          _btnController.error();
        }
      } finally {
        await Future.delayed(const Duration(seconds: 1));
        if (isMounted()) {
          _btnController.stop();
          _btnController.reset();
        }
      }
    }

    return Container(
      child: RoundedLoadingButton(
        borderRadius: 0,
        color: Colors.blue,
        successColor: Colors.green,
        errorColor: Colors.red,
        child: child,
        controller: _btnController,
        onPressed: _addToCart,
      ),
    );
  }
}
