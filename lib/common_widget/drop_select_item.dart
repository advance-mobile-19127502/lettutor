import 'package:flutter/material.dart';
import 'package:lettutor/common_widget/multi_select.dart';

class DropDownSelectMenuItem extends StatefulWidget {
  final List<String> optionsList;
  List<String> selectedList;
  final String hintTitle;

  DropDownSelectMenuItem(
      {Key? key,
      required this.optionsList,
      required this.selectedList,
      required this.hintTitle})
      : super(key: key);

  @override
  State<DropDownSelectMenuItem> createState() => _DropDownSelectMenuItemState();
}

class _DropDownSelectMenuItemState extends State<DropDownSelectMenuItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width / 2.5,
      child: TextField(
        controller: _controller,
        readOnly: true,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: widget.hintTitle,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            suffixIcon: IconButton(
                onPressed: () {
                  _showMultiSelect();
                },
                icon: Icon(Icons.keyboard_arrow_down_sharp)),
            prefixIcon: widget.selectedList.length < 1
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: widget.selectedList
                          .map((e) => Container(
                                constraints: BoxConstraints(
                                    maxWidth: screenSize.width / 3.25),
                                child: Chip(
                                  label: Text(
                                    e,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onDeleted: () {
                                    setState(() {
                                      widget.selectedList.remove(e);
                                    });
                                  },
                                ),
                              ))
                          .toList(),
                    ),
                  )),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  void _showMultiSelect() async {
    widget.selectedList = await showDialog(
            context: context,
            builder: (context) {
              return MultiSelect(
                  items: widget.optionsList,
                  title: widget.hintTitle,
                  selectedItems: widget.selectedList);
            }) ??
        widget.selectedList;
    setState(() {});
  }
}
