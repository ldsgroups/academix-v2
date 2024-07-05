import 'package:flutter/foundation.dart';

@immutable
class SubjectModel {
  const SubjectModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.gradeId,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      gradeId: json['grade_id'] as String,
    );
  } // Validation example

  final String id;
  final String name;
  final String icon;
  final String color;
  final String gradeId;

  SubjectModel copyWith({
    String? id,
    String? name,
    String? icon,
    String? color,
    String? gradeId,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      gradeId: gradeId ?? this.gradeId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'color': color,
      'grade_id': gradeId,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          icon == other.icon &&
          color == other.color &&
          gradeId == other.gradeId;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      icon.hashCode ^
      color.hashCode ^
      gradeId.hashCode;

  @override
  String toString() {
    return 'SubjectModel{id: $id, name: $name, icon: $icon, color: $color, gradeId: $gradeId}';
  }

  static final List<SubjectModel> subjects = [
    const SubjectModel(
      id: '1',
      name: 'Français',
      icon: 'language',
      color: 'blue',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '2',
      name: 'Mathématiques',
      icon: 'number',
      color: 'red',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '3',
      name: 'Anglais',
      icon: 'language',
      color: 'green',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '4',
      name: 'Allemand',
      icon: 'language',
      color: 'yellow',
      gradeId: 'optional',
    ),
    const SubjectModel(
      id: '5',
      name: 'Histoire-Géographie',
      icon: 'geography',
      color: 'purple',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '6',
      name: 'Sciences de la Vie et de la Terre (SVT)',
      icon: 'body',
      color: 'orange',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '7',
      name: 'Physique-Chimie',
      icon: 'chimestry',
      color: 'pink',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '8',
      name: 'Éducation Physique et Sportive (EPS)',
      icon: 'sport',
      color: 'brown',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '9',
      name: 'Arts Plastiques',
      icon: 'sport', // TODO: fix
      color: 'gray',
      gradeId: 'all',
    ),
    const SubjectModel(
      id: '10',
      name: 'Philosophie',
      icon: 'sport', // TODO: fix
      color: 'cyan',
      gradeId: '12',
    ),
  ];
}
