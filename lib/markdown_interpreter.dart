import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:md_interpreter/heading_interpreter.dart';
import 'package:md_interpreter/list_interpreter.dart';
import 'package:md_interpreter/text_interpreter.dart';

class MarkdownInterpreter extends StatelessWidget {
  final String markdownText;

  const MarkdownInterpreter({super.key, required this.markdownText});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: parseMarkdownText(),
      ),
    );
  }

  List<Widget> parseMarkdownText() {
    List<Widget> widgets = [];

    LineSplitter.split(markdownText).forEach((line) {
      if (line.startsWith('#')) {
        widgets.add(createHeadingWidget(line));
      } else if (line.startsWith('-')) {
        widgets.add(createBulletPointWidget(line));
      } else {
        List<MarkdownSegment> parsedMarkdown = parseMarkdown(line);
        widgets.add(RichText(
            text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
          ),
          children:
              parsedMarkdown.map((segment) => buildTextSpan(segment)).toList(),
        )));
      }
    });
    widgets.add(Container(
      
        // border: Border(
        // left: BorderSide( //                   <--- left side
        //   color: Colors.black,
        //   width: 3.0,
        // ),
        // top: BorderSide( //                    <--- top side
        //   color: Colors.black,
        //   width: 3.0,
        // ),
        // ),
        ));
    return widgets;
  }
}
