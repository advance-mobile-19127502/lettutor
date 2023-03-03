import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/history_list.dart';
import 'package:lettutor/models/booking_history.dart';
import 'package:lettutor/pages/history_page/widgets/header_history_row.dart';
import 'package:lettutor/pages/history_page/widgets/history_tile.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
          child: Column(
            children: [
              const HeaderHistoryRow(),
              const SizedBox(height: StyleConst.kDefaultPadding,),
              ...listHistoryExample
                  .map((e) => Provider(create: (_) => e, child: const HistoryTile()))
            ],
          ),
        ),
      ),
    );
  }
}
