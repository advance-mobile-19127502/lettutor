import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect(
      {Key? key,
      required this.items,
      required this.title,
      required this.selectedItems})
      : super(key: key);
  final List<String> items;
  final String title;
  final List<String> selectedItems;

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> tempSelectedItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempSelectedItems.addAll(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((value) => CheckboxListTile(
                  value: tempSelectedItems.contains(value),
                  title: Text(value),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => _itemChange(value, isChecked!)))
              .toList(),
        ),
      ),
      actions: [
        TextButton(onPressed: _cancel, child: const Text("Cancel")),
        TextButton(onPressed: _submit, child: const Text("Save")),
      ],
    );
  }

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        tempSelectedItems.add(itemValue);
      } else {
        tempSelectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, tempSelectedItems);
  }
}
