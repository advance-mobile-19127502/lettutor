import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/booking_history_bloc/booking_history_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/history_list.dart';
import 'package:lettutor/models/booking_history.dart';
import 'package:lettutor/pages/history_page/widgets/build_list_history.dart';
import 'package:lettutor/pages/history_page/widgets/header_history_row.dart';
import 'package:lettutor/pages/history_page/widgets/history_tile.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
      bookingHistoryBloc.add(FetchBookingHistoryEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: BlocListener<BookingHistoryBloc, BookingHistoryState>(
          listener: (context, state) {
            if (state is BookingHistorySuccess) {
              final isScrollable =
                  scrollController.position.maxScrollExtent > 0;
              if (_isScrollAble != isScrollable) {
                _isScrollAble = isScrollable;
              }
              if (!_isScrollAble) {
                bookingHistoryBloc.add(FetchBookingHistoryEvent());
              }
            }
            if (state is BookingHistoryInitial) {
              _isScrollAble = false;
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              children: const [
                HeaderHistoryRow(),
                SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),
                BuildListHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
