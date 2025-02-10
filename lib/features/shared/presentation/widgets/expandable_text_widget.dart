import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTextWidget extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  const ExpandableTextWidget({
    Key? key,
    required this.text,
    this.maxLines = 2,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ExpandableNotifier(
        child: Column(
          children: <Widget>[
            Expandable(
              collapsed: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: style,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ExpandableButton(
                    child: const Text(
                      'More',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600,),
                    ),
                  ),
                ],
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: style,
                  ),
                  ExpandableButton(
                    child: const Text(
                      'Show less',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
