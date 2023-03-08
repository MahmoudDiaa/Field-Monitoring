import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget sections({
  required String image,
  required String title,
  required String subTitle,
}) =>
    Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(
          width: 4,
        ),
        Text(
          "${title}: ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 130,
          child: Text(
            subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
          ),
        )
      ],
    );

Widget sectionsColumn({
  required String image,
  required String title,
  required String subTitle,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(image),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${title}: ",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              subTitle,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            )
          ],
        )
      ],
    );
