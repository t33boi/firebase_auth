// notification_snackbar.dart

import 'package:flutter/material.dart';

class CustomSnackBar {

  static void show(BuildContext context, String messageType,String message) {
    Color backgroundColor;
    IconData iconData;

    switch (messageType) {
      case 'Success':
        backgroundColor = Colors.green;
        iconData = Icons.check_circle_outline;
        break;
      case 'Info':
        backgroundColor = Colors.blueAccent;
        iconData = Icons.info_outline;
        break;
      case 'Warning':
        backgroundColor = Colors.orange;
        iconData = Icons.warning_amber_outlined;
        break;
      case 'Error':
        backgroundColor = Colors.redAccent;
        iconData = Icons.error_outline;
        break;
      default:
        backgroundColor = Colors.grey;
        iconData = Icons.info;
        break;
    }

    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Icon(iconData),
          const SizedBox(width: 10),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
