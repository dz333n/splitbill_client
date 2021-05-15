import 'package:flutter/material.dart';

class TakePartButton extends StatelessWidget {
  final void Function() onTap;

  TakePartButton({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyText1.copyWith(
      color: theme.primaryColor,
    );

    return FlatButton(
      onPressed: onTap,
      child: Text(
        "THAT'S MINE",
        style: textStyle,
      ),
    );
  }
}
