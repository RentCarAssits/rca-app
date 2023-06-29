import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomVehicleField extends StatelessWidget {
  final bool isTopField; // To round the top corners
  final bool isBottomField; // To round the bottom corners
  final String? label;
  final String text;
  final int maxLines;
  final bool isDate;

  const CustomVehicleField({
    Key? key,
    this.isTopField = false,
    this.isBottomField = false,
    this.label,
    this.maxLines = 1,
    this.isDate = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayText = text;
    if (isDate) {
      DateTime parsedDate = DateTime.parse(text);
      displayText = DateFormat('yyyy-MM-dd').format(parsedDate);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        Text(
          displayText,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
