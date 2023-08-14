import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 50,
        width: 50,
        child: Center(child: CircularProgressIndicator.adaptive()));
  }
}
