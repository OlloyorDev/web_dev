import 'package:flutter/material.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/features/home/presentation/pages/web/home_web_page.dart';

class WebAppbar extends StatelessWidget {
  const WebAppbar({super.key});

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: true,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 40,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Row(
            children: [
              const Text('Olloyor Nodirov'),
              const Spacer(),
              InkWell(
                onTap: () => _scrollToSection(aboutMeKey),
                child: Text(context.tr('aboutMe')),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () => _scrollToSection(experienceKey),
                child: Text(context.tr('experience')),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () => _scrollToSection(projectsKey),
                child: Text(context.tr('projects')),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () => _scrollToSection(contactsKey),
                child: Text(context.tr('contact')),
              ),
              const SizedBox(width: 20),
            ],
          ).paddingOnly(
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            bottom: 5,
          ),
        ),
      );
}
