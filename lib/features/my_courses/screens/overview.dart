import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class OverviewCard extends StatelessWidget {
  final String courseOverview = '''
# Course Overview

Welcome to the **Flutter Development** course!

In this course, we will cover the following topics:

1. **Introduction to Flutter**
   - Overview of Flutter framework
   - Setting up your development environment

2. **Building UI**
   - Using Flutter widgets like `Container`, `Row`, `Column`
   - Creating beautiful and responsive layouts

3. **State Management**
   - Understanding various state management techniques
   - Using providers, Riverpod, and setState

4. **Backend Integration**
   - Integrating Firebase with Flutter
   - Communicating with APIs

### Key Takeaways:

- You will learn how to build mobile apps with a rich user interface.
- You will become proficient in Dart and Flutter tools.
  
> "Learning Flutter is a gateway to building modern apps!" - Instructor
  ''';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppConstant.cardBackground,
      margin: EdgeInsets.all(16.0),
      elevation: 8.0,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Markdown(
            data: courseOverview,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              h1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              h2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              p: TextStyle(fontSize: 16),
              blockquote: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}