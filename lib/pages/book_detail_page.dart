import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/book_model.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(book.coverUrl, height: 220),
              ),
            ),
            const SizedBox(height: 20),
            Text(book.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'By ${book.authorNames.join(', ')}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Chip(label: Text('Published: ${book.publishYear}')),
                  const SizedBox(width: 8),
                  Chip(label: Text('Editions: ${book.editionCount}')),
                  const SizedBox(width: 8),
                  Chip(label: Text('Ebook: ${book.ebookAccess.toUpperCase()}')),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse(book.openLibUrl));
                },
                icon: const Icon(Icons.open_in_browser),
                label: const Text('Open in OpenLibrary'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
