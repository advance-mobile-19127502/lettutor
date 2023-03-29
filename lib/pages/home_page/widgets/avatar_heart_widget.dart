import 'package:flutter/material.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';

class AvatarAndHeartWidget extends StatefulWidget {
  const AvatarAndHeartWidget({Key? key, required this.tutorInfo})
      : super(key: key);
  final TutorInfoPagination tutorInfo;

  @override
  State<AvatarAndHeartWidget> createState() => _AvatarAndHeartWidgetState();
}

class _AvatarAndHeartWidgetState extends State<AvatarAndHeartWidget> {
  // late Tutor tutor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(40),
              child: Image.network(
                widget.tutorInfo.avatar ??
                    "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Image.network(
                      "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                },
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
