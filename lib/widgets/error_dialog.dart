import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorDialog extends StatelessWidget {
  final bool? exitsApp;
  final String title;
  final String body;

  const ErrorDialog({
    Key? key,
    required this.exitsApp,
    required this.title,
    required this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
      ),
      actions: [
        TextButton(
          child: Text("Okay"),
          onPressed: () async {
            if (exitsApp != null && exitsApp!) {
              await SystemChannels.platform
                  .invokeMethod<void>('SystemNavigator.pop', true);
            } else {
              Navigator.of(context).pop();
            }
          },
        )
      ],

    );
  }
}
