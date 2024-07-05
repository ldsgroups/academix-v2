import 'package:academix/models/models.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this.lesson});

  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          _buildCardImage(lesson.imageUrl),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Tooltip(
                  message: lesson.title,
                  child: Text(
                    lesson.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _countInfoInCard(
                  icon: Icons.align_horizontal_left,
                  count: 10,
                  title: 'exercices',
                ),
                _countInfoInCard(
                  icon: Icons.star,
                  count: 2,
                  title: '(${lesson.ratingCount} votes)',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _countInfoInCard({
    required int count,
    required String title,
    required IconData icon,
  }) {
    final _color = icon == Icons.star ? Colors.orange : Colors.grey;

    return Row(
      children: [
        Icon(icon, color: _color, size: 16),
        const SizedBox(width: 8),
        Text(
          count.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  ClipRRect _buildCardImage(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
        width: double.infinity,
        height: 100,
      ),
    );
  }
}
