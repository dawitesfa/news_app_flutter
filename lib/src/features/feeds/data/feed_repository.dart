import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_repository.g.dart';

class FeedRepository {
  final Dio _dio;
  FeedRepository(this._dio);

  Future<Map<String, dynamic>?> fetchNews({required String url}) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      // print('[fetching] ${e.toString()}');
      debugPrint('[fetching] ${e.toString()}');
    }
    return null;
  }
}

@riverpod
FeedRepository feedRepository(FeedRepositoryRef ref) {
  return FeedRepository(Dio());
}
