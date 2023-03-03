import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/booking_history.dart';
import 'package:provider/provider.dart';

class ExpansionContainer extends StatefulWidget {
  const ExpansionContainer({Key? key, required this.isReview})
      : super(key: key);
  final bool isReview;

  @override
  State<ExpansionContainer> createState() => _ExpansionContainerState();
}

class _ExpansionContainerState extends State<ExpansionContainer> {
  late BookingHostory history;

  TextStyle textStyle =
      GoogleFonts.roboto(textStyle: FontConst.regular.copyWith(fontSize: 14));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    history = Provider.of<BookingHostory>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isReview) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: StyleConst.kDefaultPadding / 2),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
        child: history.request == null
            ? Container(
                padding: const EdgeInsets.symmetric(
                    vertical: StyleConst.kDefaultPadding  / 1.25),
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
                      Text(
                        history.request!,
                        style: textStyle,
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
      child: history.review == null
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
                    Text(
                      history.review!,
                      style: textStyle,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
