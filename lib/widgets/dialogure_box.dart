import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Cupertinomodel(BuildContext context) async {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) =>
        CupertinoAlertDialog(
          title: const Text('Alert'),
          content: const Text('Proceed with destructive action?'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(

              /// This parameter indicates this action is the default,
              /// and turns the action's text to bold text.
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            CupertinoDialogAction(

              /// This parameter indicates the action would perform
              /// a destructive action such as deletion, and turns
              /// the action's text color to red.
              isDestructiveAction: true,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/welcome_screen');

              },
              child: const Text('Yes'),
            ),
          ],
        ),
  );
}