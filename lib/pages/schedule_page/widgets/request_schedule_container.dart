import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/booking_schedule.dart';
import 'package:lettutor/pages/schedule_page/widgets/edit_request_dialog.dart';
import 'package:provider/provider.dart';

class RequestScheduleContainer extends StatefulWidget {
  const RequestScheduleContainer({Key? key}) : super(key: key);

  @override
  State<RequestScheduleContainer> createState() =>
      _RequestScheduleContainerState();
}

class _RequestScheduleContainerState extends State<RequestScheduleContainer> {
  late TextEditingController _controller;
  late BookingSchedule schedule;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    schedule = Provider.of(context, listen: false);
    _controller = TextEditingController();
    _controller.text = schedule.request != null ? schedule.request! : "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Request for lesson",
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.semiBold.copyWith(fontSize: 14)),
                ),
                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.lightBlue,
                          )),
                      onPressed: () {
                        editRequest(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.edit,
                            size: 14,
                            color: Colors.lightBlue,
                          ),
                          const SizedBox(
                            width: StyleConst.kDefaultPadding / 3,
                          ),
                          Text(
                            "Edit Request",
                            style: GoogleFonts.roboto(
                                textStyle: FontConst.medium.copyWith(
                              fontSize: 14,
                              color: Colors.lightBlue,
                            )),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            indent: 0,
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: StyleConst.kDefaultPadding / 2),
            child: TextField(
              controller: _controller,
              maxLines: null,
              enabled: false,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.medium
                      .copyWith(fontSize: 14, color: ColorConst.greyTextColor)),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "No request for lesson"),
            ),
          )
        ],
      ),
    );
  }

  void editRequest(BuildContext context) async {
    _controller.text = await showDialog(
        context: context,
        builder: (context) => Provider(
            create: (context) => schedule.request, child: EditRequestDialog()));

    schedule.request = _controller.text;
  }
}
