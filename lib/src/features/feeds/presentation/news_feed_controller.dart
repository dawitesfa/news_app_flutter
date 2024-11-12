import 'package:news_app/src/features/feeds/domain/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_feed_controller.g.dart';

@riverpod
class NewsFeeds extends _$NewsFeeds {
  @override
  FutureOr<List<Feed>> build() {
    return [];
  }
}
