import 'package:flutter/material.dart';
import 'package:hive_note_app/views/widgets/build_color_item.dart';

import '../../cubit/add_note_cubit.dart';

class BuildColorList extends StatefulWidget {
  const BuildColorList({super.key});

  @override
  State<BuildColorList> createState() => _BuildColorListState();
}

class _BuildColorListState extends State<BuildColorList> {
  int currentIndex = 0;
  static const List<Color> kNoteColors = [
    Color(0xffF28B82), // Red
    Color(0xffFBBC04), // Yellow
    Color(0xffFFF475), // Light Yellow
    Color(0xffCCFF90), // Green
    Color(0xffA7FFEB), // Mint
    Color(0xffCBF0F8), // Blue
    Color(0xffD7AEFB), // Purple
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28 * 2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              AddNoteCubit.get(context).color=kNoteColors[index];

            });
          },
          child: BuildColorItem(color:kNoteColors[index],isActive:index == currentIndex ? true : false,),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: kNoteColors.length,
      ),
    );
  }
}
