import 'package:flutter/material.dart';

class MarkdownSegment {
  String content;
  bool isBold;
  bool isItalic;

  MarkdownSegment({
    required this.content,
    required this.isBold,
    required this.isItalic,
  });
}

List<MarkdownSegment> parseMarkdown(String markdown) {
  List<MarkdownSegment> result = [];
  List<String> stack = [];
  StringBuffer currentContent = StringBuffer();

  void flushCurrentContent() {
    if (currentContent.isNotEmpty) {
      result.add(MarkdownSegment(
        content: currentContent.toString(),
        isBold: isBold(stack),
        isItalic: isItalic(stack),
      ));
      currentContent.clear();
    }
  }

  for (int i = 0; i < markdown.length; i++) {
    if (isThreeAsterisks(markdown, i)) {
      flushCurrentContent();
      handleThreeAsterisks(stack);
      i += 2;
    } else if (isTwoAsterisks(markdown, i)) {
      flushCurrentContent();
      handleTwoAsterisks(stack);
      i++;
    } else if (isSingleAsterisk(markdown, i)) {
      flushCurrentContent();
      handleSingleAsterisk(stack);
    } else {
      currentContent.write(markdown[i]);
    }
  }

  flushCurrentContent();

  return result;
}

// Check if the current position has three consecutive asterisks (for bold and italic)
bool isThreeAsterisks(String markdown, int index) {
  return (markdown[index] == '*' &&
      index + 2 < markdown.length &&
      markdown[index + 1] == '*' &&
      markdown[index + 2] == '*');
}

// Check if the current position has two consecutive asterisks (for bold)
bool isTwoAsterisks(String markdown, int index) {
  return (markdown[index] == '*' &&
      index + 1 < markdown.length &&
      markdown[index + 1] == '*');
}

// Check if the current position has a single asterisk (for italic)
bool isSingleAsterisk(String markdown, int index) {
  return (markdown[index] == '*');
}

// Check if the content should be bold based on the stack
bool isBold(List<String> stack) {
  return stack.contains('**') || stack.contains('***');
}

// Check if the content should be italic based on the stack
bool isItalic(List<String> stack) {
  return stack.contains('*') || stack.contains('***');
}

// Handle three consecutive asterisks for bold and italic
void handleThreeAsterisks(List<String> stack) {
  if (stack.isEmpty || stack.last != '***') {
    stack.add('***');
  } else {
    stack.removeLast();
  }
}

// Handle two consecutive asterisks for bold
void handleTwoAsterisks(List<String> stack) {
  if (stack.isEmpty || stack.last != '**') {
    stack.add('**');
  } else {
    stack.removeLast();
  }
}

// Handle a single asterisk for italic
void handleSingleAsterisk(List<String> stack) {
  if (stack.isEmpty || stack.last != '*') {
    stack.add('*');
  } else {
    stack.removeLast();
  }
}

TextSpan buildTextSpan(segment) {
  TextStyle textStyle = const TextStyle();

  if (segment.isBold) {
    textStyle = textStyle.copyWith(fontWeight: FontWeight.bold);
  }

  if (segment.isItalic) {
    textStyle = textStyle.copyWith(fontStyle: FontStyle.italic);
  }

  return TextSpan(
    text: segment.content,
    style: textStyle,
  );
}
