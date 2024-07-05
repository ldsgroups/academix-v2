import 'package:academix/core/constants/constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class LessonModel {
  const LessonModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.exerciseCount,
    required this.ratingCount,
    required this.rating,
    required this.subjectId,
    required this.gradeId,
    required this.isFavorite,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      exerciseCount: json['exercise_count'] as int,
      ratingCount: json['rating_count'] as int,
      rating: json['rating'] as double,
      subjectId: json['subject_id'] as String,
      gradeId: json['grade_id'] as String,
      isFavorite: json['is_favorite'] as bool,
    );
  } // Validation example

  final String id;
  final String title;
  final String imageUrl;
  final int exerciseCount;
  final int ratingCount;
  final double rating;
  final String subjectId;
  final String gradeId;
  final bool isFavorite;

  LessonModel copyWith({
    String? id,
    String? title,
    String? imageUrl,
    int? exerciseCount,
    int? ratingCount,
    double? rating,
    String? subjectId,
    String? gradeId,
    bool? isFavorite,
  }) {
    return LessonModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      exerciseCount: exerciseCount ?? this.exerciseCount,
      ratingCount: ratingCount ?? this.ratingCount,
      rating: rating ?? this.rating,
      subjectId: subjectId ?? this.subjectId,
      gradeId: gradeId ?? this.gradeId,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_url': imageUrl,
      'exercise_count': exerciseCount,
      'rating_count': ratingCount,
      'rating': rating,
      'subject_id': subjectId,
      'grade_id': gradeId,
      'is_favorite': isFavorite,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          imageUrl == other.imageUrl &&
          exerciseCount == other.exerciseCount &&
          ratingCount == other.ratingCount &&
          rating == other.rating &&
          subjectId == other.subjectId &&
          gradeId == other.gradeId &&
          isFavorite == other.isFavorite;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      exerciseCount.hashCode ^
      ratingCount.hashCode ^
      rating.hashCode ^
      subjectId.hashCode ^
      gradeId.hashCode ^
      isFavorite.hashCode;

  @override
  String toString() {
    return 'LessonModel{id: $id, title: $title, imageUrl: $imageUrl, exerciseCount: $exerciseCount, ratingCount: $ratingCount, rating: $rating, subjectId: $subjectId, gradeId: $gradeId, isFavorite: $isFavorite}';
  }

  static final List<LessonModel> lessons = [
    const LessonModel(
      id: '1',
      title: 'Introduction to Fractions',
      imageUrl: AssetConstants.fractionImg,
      exerciseCount: 10,
      ratingCount: 23,
      rating: 4.5,
      subjectId: '1',
      gradeId: '1',
      isFavorite: true,
    ),
    const LessonModel(
      id: '2',
      title: "The History of Côte d'Ivoire",
      imageUrl: AssetConstants.historyImg,
      exerciseCount: 12,
      ratingCount: 9,
      rating: 5,
      subjectId: '2',
      gradeId: '2',
      isFavorite: false,
    ),
    const LessonModel(
      id: '3',
      title: 'English Grammar Fundamentals',
      imageUrl: AssetConstants.englishImg,
      exerciseCount: 20,
      ratingCount: 35,
      rating: 4.2,
      subjectId: '3',
      gradeId: '3',
      isFavorite: true,
    ),
    const LessonModel(
      id: '4',
      title: 'Geography of Africa',
      imageUrl: AssetConstants.geographyImg,
      exerciseCount: 8,
      ratingCount: 18,
      rating: 4.8,
      subjectId: '4',
      gradeId: '4',
      isFavorite: false,
    ),
    const LessonModel(
      id: '5',
      title: 'Introduction to Philosophy',
      imageUrl: AssetConstants.philosophyImg,
      exerciseCount: 5,
      ratingCount: 12,
      rating: 4,
      subjectId: '5',
      gradeId: '5',
      isFavorite: true,
    ),
    const LessonModel(
      id: '6',
      title: 'Physical Education and Sports',
      imageUrl: AssetConstants.sportImg,
      exerciseCount: 3,
      ratingCount: 7,
      rating: 4.6,
      subjectId: '6',
      gradeId: '6',
      isFavorite: false,
    ),
    const LessonModel(
      id: '7',
      title: 'Les base de la chime',
      imageUrl: AssetConstants.chimestryImg,
      exerciseCount: 15,
      ratingCount: 28,
      rating: 4.3,
      subjectId: '7',
      gradeId: '3',
      isFavorite: true,
    ),
    const LessonModel(
      id: '8',
      title: 'Langue française et culture',
      imageUrl: AssetConstants.grammarImg,
      exerciseCount: 18,
      ratingCount: 32,
      rating: 4.7,
      subjectId: '8',
      gradeId: '4',
      isFavorite: false,
    ),
    const LessonModel(
      id: '9',
      title: 'Algèbre pour les débutants',
      imageUrl: AssetConstants.algebraImg,
      exerciseCount: 22,
      ratingCount: 40,
      rating: 4.1,
      subjectId: '9',
      gradeId: '5',
      isFavorite: true,
    ),
    const LessonModel(
      id: '10',
      title: 'Histoire du monde: Ancienne Civilizations',
      imageUrl: AssetConstants.historyImg,
      exerciseCount: 10,
      ratingCount: 21,
      rating: 4.6,
      subjectId: '2',
      gradeId: '6',
      isFavorite: false,
    ),
    const LessonModel(
      id: '11',
      title: 'Santé et bien-être',
      imageUrl: AssetConstants.healthImg,
      exerciseCount: 6,
      ratingCount: 15,
      rating: 4.9,
      subjectId: '10',
      gradeId: '2',
      isFavorite: true,
    ),
  ];
}
