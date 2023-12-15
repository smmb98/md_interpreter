import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:md_interpreter/text_interpreter.dart';

Widget createHeadingWidget(String line) {
  // Identify the heading level and set the appropriate font size and line height
  int level = line.indexOf(' ');
  double fontSize;
  double lineHeight;
  switch (level) {
    case 1:
      fontSize = 2.125;
      lineHeight = 1.0;
      break;
    case 2:
      fontSize = 1.875;
      lineHeight = 1.067;
      break;
    case 3:
      fontSize = 1.5;
      lineHeight = 1.083;
      break;
    case 4:
      fontSize = 1.25;
      lineHeight = 1.1;
      break;
    case 5:
      fontSize = 1.125;
      lineHeight = 1.111;
      break;
    case 6:
    default:
      fontSize = 1.0;
      lineHeight = 1.125;
      break;
  }

  String headingText = line.substring(level + 1);

  List<MarkdownSegment> parsedMarkdown = parseMarkdown(headingText);

  return RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: fontSize * 16.0,
        height: lineHeight * 1.6,
      ),
      children:
          parsedMarkdown.map((segment) => buildTextSpan(segment)).toList(),
    ),
  );
}
