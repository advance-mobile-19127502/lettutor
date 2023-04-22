import 'package:flutter/material.dart';

class MultiSelectMapKeyValue extends StatefulWidget {
  const MultiSelectMapKeyValue(
      {Key? key,
      required this.items,
      required this.title,
      required this.selectedItems})
      : super(key: key);
  final Map<String, dynamic> items;
  final String title;
  final Map<String, dynamic> selectedItems;

  @override
  State<MultiSelectMapKeyValue> createState() => _MultiSelectMapKeyValueState();
}

class _MultiSelectMapKeyValueState extends State<MultiSelectMapKeyValue> {
  Map<String, dynamic> tempSelectedItem = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempSelectedItem.addAll(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.entries
              .map((value) => CheckboxListTile(
                  value: tempSelectedItem.containsKey(value.key),
                  title: Text(value.key),
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

  void _itemChange(MapEntry<String, dynamic> itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        tempSelectedItem[itemValue.key] = itemValue.value;
      } else {
        tempSelectedItem.remove(itemValue.key);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, tempSelectedItem);
  }
}
