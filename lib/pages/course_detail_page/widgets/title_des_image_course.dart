import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TitleDesImageWidget extends StatefulWidget {
  const TitleDesImageWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description})
      : super(key: key);
  final String imageUrl, title, description;

  @override
  State<TitleDesImageWidget> createState() => _TitleDesImageWidgetState();
}

class _TitleDesImageWidgetState extends State<TitleDesImageWidget> {
  late final ImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _imageProvider = NetworkImage(widget.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.black26,
            ),
          ]),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(StyleConst.defaultRadius),
                  topLeft: Radius.circular(StyleConst.defaultRadius)),
              child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.fill,
                  errorWidget: (_, __, ___) {
                    return Image.network(
                        "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                  })),
          Padding(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.semiBold.copyWith(fontSize: 16)),
                ),
                Text(
                  widget.description,
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.medium.copyWith(
                          fontSize: 12, color: ColorConst.greyTextColor)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
