import 'package:academix/core/utils/svg_from_text.dart';
import 'package:academix/core/utils/utils.dart';
import 'package:academix/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.subject});

  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const _subjectCardSize = 72.0;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: _subjectCardSize * 1.2,
          height: _subjectCardSize,
          decoration: BoxDecoration(
            color: getColor(
              context: context,
              colorName: subject.color,
            ).backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 4),
        ),
        Positioned(
          top: -_subjectCardSize * 0.02,
          left: 0,
          right: 0,
          child: Container(
            width: _subjectCardSize * 0.6,
            height: _subjectCardSize * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(
                context: context,
                colorName: subject.color,
              ).backgroundColor,
              border: Border.all(
                color: colorScheme.surface,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                getSvg(svgName: subject.icon),
                colorFilter: ColorFilter.mode(
                  getColor(
                    context: context,
                    colorName: subject.color,
                  ).foregroundColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: _subjectCardSize * 0.25,
          left: 8,
          right: 8,
          child: Tooltip(
            message: subject.name,
            child: Text(
              subject.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
