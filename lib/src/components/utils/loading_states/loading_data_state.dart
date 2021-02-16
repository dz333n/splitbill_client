import 'package:flutter/material.dart';

class LoadingDataState extends StatelessWidget {
  static LoadingDataState forAsyncValue() {
    return LoadingDataState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
