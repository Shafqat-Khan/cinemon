import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  int maxLines;

  ExpandableText({super.key, required this.text, this.maxLines = 1});

  @override
  // ignore: library_private_types_in_public_api
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Text(
        widget.text,
        textAlign: TextAlign.justify,
        maxLines: isExpanded ? null : widget.maxLines,
        overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
      ),
    );
  }
}
