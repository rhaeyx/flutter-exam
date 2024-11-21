import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> photoUrls;

  const ImageCarousel({super.key, required this.photoUrls});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;

  void _handleRight() {
    setState(() {
      if (_current + 1 >= widget.photoUrls.length) {
        _current = 0;
        return;
      }

      _current++;
    });
  }

  void _handleLeft() {
    setState(() {
      if (_current - 1 < 0) {
        _current = widget.photoUrls.length - 1;
        return;
      }

      _current--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadButton(
              icon: const FaIcon(FontAwesomeIcons.caretLeft),
              onPressed: _handleLeft,
            ),
            const SizedBox(width: 18),
            ShadButton(
              icon: const FaIcon(FontAwesomeIcons.caretRight),
              onPressed: _handleRight,
            ),
          ],
        ),
        const SizedBox(height: 18),
        Image.network(
          widget.photoUrls[_current],
          height: 500,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }

            return const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
              height: 500,
            );
          },
        ),
      ],
    );
  }
}
