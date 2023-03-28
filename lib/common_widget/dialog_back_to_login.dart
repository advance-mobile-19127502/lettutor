import 'package:flutter/material.dart';
import 'package:lettutor/pages/login_page/login_page.dart';
import 'package:lettutor/route_generator.dart';

class DialogBackToLogin extends StatelessWidget {
  const DialogBackToLogin(
      {Key? key, required this.title, required this.content})
      : super(key: key);
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  ModalRoute.withName(RouteGenerator.loginRoute));
            },
            child: const Text("Back to login")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"))
      ],
    );
  }
}
