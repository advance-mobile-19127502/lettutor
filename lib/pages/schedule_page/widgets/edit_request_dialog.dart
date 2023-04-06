import 'package:flutter/material.dart';
import 'package:lettutor/constants/style_const.dart';

class EditRequestDialog extends StatelessWidget {
  EditRequestDialog({Key? key, required this.studentRequest}) : super(key: key);
  final String studentRequest;
  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String? requestSchedule = Provider.of(context, listen: false);

    textFieldController.text = studentRequest;

    Size screenSize = MediaQuery.of(context).size;
    return AlertDialog(
        content: SizedBox(
      width: screenSize.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: textFieldController,
              cursorColor: Colors.black,
              maxLines: null,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Edit request for lessons",
                  focusedBorder: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: StyleConst.kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                const SizedBox(width: StyleConst.kDefaultPadding),
                ElevatedButton(
                    onPressed: () =>
                        Navigator.pop(context, textFieldController.text),
                    child: const Text("Save")),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
