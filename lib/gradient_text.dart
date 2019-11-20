library gradient_text;

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GradientText extends StatelessWidget {
  GradientText(this.data,
      {@required this.gradient,
      this.style,
      this.textAlign = TextAlign.left,
      this.autosize = false,
      this.maxLines,
      this.textScaleFactor});

  final String data;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;
  final double textScaleFactor;
  final bool autosize;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: autosize
          ? AutoSizeText(
              data,
              maxLines: maxLines,
              textScaleFactor: textScaleFactor,
              textAlign: textAlign,
              style: (style == null)
                  ? TextStyle(color: Colors.white)
                  : style.copyWith(color: Colors.white),
            )
          : Text(
              data,
              textScaleFactor: textScaleFactor,
              textAlign: textAlign,
              maxLines: maxLines,
              style: (style == null)
                  ? TextStyle(color: Colors.white)
                  : style.copyWith(color: Colors.white),
            ),
    );
  }
}
