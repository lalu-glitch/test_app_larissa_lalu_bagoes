import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  final String message;
  final String callbackMessageOnButton;
  final VoidCallback callback;
  const WidgetError({
    super.key,
    required this.message,
    required this.callback,
    required this.callbackMessageOnButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.error, color: Colors.red, weight: 150),
          Text(message, style: const TextStyle(color: Colors.red)),
          ElevatedButton(
            onPressed: () async => callback(),
            child: Text(callbackMessageOnButton),
          ),
        ],
      ),
    );
  }
}
