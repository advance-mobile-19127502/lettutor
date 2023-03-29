import 'package:flutter/material.dart';
import 'package:lettutor/models/from_api/review.dart';
import 'package:lettutor/repositories/base_repository.dart';

class ReviewsRepository extends BaseRepository {
  ReviewsRepository(super.baseUrl);

  Future<List<Review>> getListReviews(
      String tutorId, int perPage, int page) async {
    try {
      final response = await apiProvider.get(
          url: "/$tutorId", queryParams: {"page": page, "perPage": perPage});
      Iterable l = response["data"]["rows"];
      return List<Review>.from(l.map((e) => Review.fromJson(e))).toList();
    } catch (error) {
      rethrow;
    }
  }
}
