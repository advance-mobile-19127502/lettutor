import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor_info.dart';

class AvatarAndHeartWidget extends StatefulWidget {
  final Tutor tutor;

  const AvatarAndHeartWidget({Key? key, required this.tutor}) : super(key: key);

  @override
  State<AvatarAndHeartWidget> createState() => _AvatarAndHeartWidgetState();
}

class _AvatarAndHeartWidgetState extends State<AvatarAndHeartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(widget.tutor.ava_url),
          ),
        ),
        Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  widget.tutor.isFavorite = !widget.tutor.isFavorite;
                });
              },
              icon: widget.tutor.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              color: widget.tutor.isFavorite ? Colors.red : Colors.blue,
            ))
      ],
    );
  }
}
