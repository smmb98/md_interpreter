import 'package:flutter/material.dart';
import 'markdown_interpreter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Markdown Interpreter'),
        ),
        body: const MarkdownInterpreter(
//           markdownText: """
// # ***sun*** was setting, casting a warm glow on the **majestic mountains**. In the distance, a lone *bird* soared through the *crimson* sky.
//           """,
//           markdownText: """
// ###### This is **bold** and *italic*. Also, *this is **bold** inside italic*. The ***sun*** was setting, casting a warm glow on the **majestic mountains**. In the distance, a lone *bird* soared through the *crimson* sky.
//           """,
          markdownText: """
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

- Bullet Point 1
- Bullet Point 2

Normal Text with *italic* and **bold**.
          """,
        ),
      ),
    );
  }
}
