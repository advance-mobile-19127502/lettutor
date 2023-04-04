import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/booking_history.dart';

class ExpansionContainer extends StatefulWidget {
  const ExpansionContainer(
      {Key? key, required this.isReview, required this.content})
      : super(key: key);
  final bool isReview;
  final String? content;

  @override
  State<ExpansionContainer> createState() => _ExpansionContainerState();
}

class _ExpansionContainerState extends State<ExpansionContainer> {
  TextStyle textStyle =
      GoogleFonts.roboto(textStyle: FontConst.regular.copyWith(fontSize: 14));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isReview) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: StyleConst.kDefaultPadding / 2),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
        child: widget.content == null
            ? Container(
                padding: const EdgeInsets.symmetric(
                    vertical: StyleConst.kDefaultPadding / 1.25),
                child: Text(
                  "No request for lesson",
                  style: textStyle,
                ))
            : ListTileTheme(
                contentPadding: EdgeInsets.zero,
                dense: true,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      "Request for lesson",
                      style: textStyle,
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                            StyleConst.kDefaultPadding / 2),
                        child: Text(
                          widget.content ?? "",
                          style: textStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
      );
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: StyleConst.kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
      child: widget.content == null
          ? Container(
              padding: const EdgeInsets.symmetric(
                  vertical: StyleConst.kDefaultPadding / 1.25),
              child: Text(
                "Tutor haven't reviewed yet",
                style: textStyle,
              ),
            )
          : ListTileTheme(
              contentPadding: EdgeInsets.zero,
              dense: true,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text("Review from tutor", style: textStyle),
                  expandedAlignment: Alignment.centerLeft,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
                      child: Text(
                        widget.content ?? "",
                        style: textStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
