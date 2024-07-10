import 'package:academix/features/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum PageNavEnum { next, previous }

class CompleteStudentProfileView extends HookConsumerWidget {
  const CompleteStudentProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const _totalPage = 3;
    final isPageInitialized = useState(false);

    final _activePage = useState(0);
    final _pageController = usePageController(initialPage: _activePage.value);

    useEffect(
      () {
        _activePage.value = 0;
        isPageInitialized.value = true;
        return null;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Academix'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: !isPageInitialized.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    itemCount: _totalPage,
                    onPageChanged: (pg) => _activePage.value = pg,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return const GeneralInfo();
                        case 1:
                          return const SchoolInfo();
                        case 2:
                          return const PreferenceInfo();
                        default:
                          return const GeneralInfo();
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPageNavigationIconButton(
                      onPressed: () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      ),
                      icon: Icons.skip_previous_rounded,
                      isActive: _activePage.value > 0,
                    ),
                    _buildPageNavigationIconButton(
                      onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      ),
                      icon: Icons.skip_next_rounded,
                      isActive: _activePage.value < _totalPage - 1,
                    ),
                  ],
                ),
                Text('${_activePage.value + 1} sur $_totalPage'),
                const SizedBox(height: 20),
              ],
            ),
    );
  }

  IconButton _buildPageNavigationIconButton({
    void Function()? onPressed,
    required IconData icon,
    bool isActive = false,
  }) {
    return isActive
        ? IconButton.filled(
            onPressed: onPressed,
            icon: Icon(icon),
          )
        : IconButton.outlined(
            onPressed: null,
            icon: Icon(icon),
          );
  }
}
