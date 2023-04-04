import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/booking_history_bloc/booking_history_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/schedule_page/widgets/build_list_schedule_history.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool _isScrollAble = false;
  late ScrollController scrollController;
  late BookingHistoryBloc bookingHistoryBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
    bookingHistoryBloc = BlocProvider.of<BookingHistoryBloc>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_isScrollAble &&
        scrollController.position.maxScrollExtent == scrollController.offset) {
      bookingHistoryBloc.add(FetchBookingEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: BlocListener<BookingHistoryBloc, BookingHistoryState>(
        listener: (context, state) {
          if (state is BookingHistorySuccess) {
            final isScrollable = scrollController.position.maxScrollExtent > 0;
            if (_isScrollAble != isScrollable) {
              _isScrollAble = isScrollable;
            }
            if (!_isScrollAble) {
              bookingHistoryBloc.add(FetchBookingEvent());
            }
          }
          if (state is BookingHistoryInitial) {
            _isScrollAble = false;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/schedule_icon.svg",
                    width: 75,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedule",
                        style: GoogleFonts.poppins(
                            textStyle:
                                FontConst.semiBold.copyWith(fontSize: 30)),
                      ),
                    ],
                  ))
                ],
              ),
              Text(
                "Here is a list of the sessions you have booked",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(
                        fontSize: 18, color: ColorConst.greyTextColor)),
              ),
              Text(
                  "You can track when the meeting starts, join the meeting with one"
                  " click or can cancel the meeting before 2 hours",
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.regular.copyWith(
                          fontSize: 18, color: ColorConst.greyTextColor))),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              const BuildListScheduleHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
