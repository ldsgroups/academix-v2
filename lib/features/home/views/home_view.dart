import 'package:academix/core/constants/asset_constants.dart';
import 'package:academix/core/utils/utils.dart';
import 'package:academix/features/home/widgets/widgets.dart';
import 'package:academix/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCtrl = useTextEditingController();

    const _subjectCardSize = 72.0;

    return Scaffold(
      appBar: csAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const AdCard(),
                Positioned(
                  bottom: -18,
                  right: 12,
                  child: Image.asset(
                    AssetConstants.listenImg,
                    width: _subjectCardSize,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
              child: SearchBar(
                elevation: WidgetStateProperty.all(0),
                shape: WidgetStatePropertyAll(roundedShape()),
                hintText: 'Rechercher une leçon ...',
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.only(left: 8),
                ),
                leading: const Icon(Icons.search),
                trailing: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grain),
                  ),
                ],
                controller: searchCtrl,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Filtrer par matière',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: ListView.builder(
                itemCount: SubjectModel.subjects.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final subject = SubjectModel.subjects[index];

                  return SubjectCard(subject: subject);
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Liste des leçons',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: GridView.builder(
                itemCount: LessonModel.lessons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final lesson = LessonModel.lessons[index];

                  return LessonCard(lesson: lesson);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
