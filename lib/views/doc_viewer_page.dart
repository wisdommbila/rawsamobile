import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DocViewerPage extends StatelessWidget {
  final String filePath;
  final String title;

  DocViewerPage({required this.filePath, required this.title});

  Future<String> _loadDocxContent() async {
    // Simulate reading .docx as plain text
    final String docxText = await rootBundle.loadString(filePath);
    return docxText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder<String>(
        future: _loadDocxContent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading document"));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: HtmlWidget(
              snapshot.data ?? "No content available.",
            ),
          );
        },
      ),
    );
  }
}
