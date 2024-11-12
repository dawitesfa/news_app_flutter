import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsFeed extends ConsumerStatefulWidget {
  const NewsFeed({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsFeedState();
}

class _NewsFeedState extends ConsumerState<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
