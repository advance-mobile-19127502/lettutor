import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget(
      {Key? key,
      required this.hintTitle,
      required this.widthSize,
      this.icon,
      this.onPressIcon})
      : super(key: key);
  final String hintTitle;
  final double widthSize;
  final IconData? icon;
  final VoidCallback? onPressIcon;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  late TextEditingController textEditingController;
  late ListTutorBloc listTutorBloc;
  FocusNode tutorNameFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    listTutorBloc = BlocProvider.of<ListTutorBloc>(context);
    tutorNameFocusNode.addListener(() {
      if (!tutorNameFocusNode.hasFocus) {
        _onSummitedTutorName();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tutorNameFocusNode.removeListener(() {});
    tutorNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListTutorBloc, ListTutorState>(
      listener: (context, state) {
        if (state is ListTutorResetFilter) {
          textEditingController.text = "";
        }
      },
      child: SizedBox(
        width: widget.widthSize,
        child: TextField(
          focusNode: tutorNameFocusNode,
          controller: textEditingController,
          onSubmitted: (value) {
            _onSummitedTutorName();
          },
          decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
              hintText: widget.hintTitle,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              suffixIcon: widget.icon != null
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: widget.onPressIcon,
                      icon: Icon(
                        widget.icon,
                        size: 14,
                      ),
                    )
                  : null),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  _onSummitedTutorName() {
    listTutorBloc.add(OnFilterListTutorEvent(
        textEditingController.text, listTutorBloc.filters.nationality, null));
  }
}
