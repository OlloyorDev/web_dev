import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';
import 'package:web_devop/features/home/presentation/pages/web/home_web_page.dart';

class WebAppbar extends StatelessWidget {
  final String name;

  const WebAppbar({super.key, required this.name});

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 48,
      automaticallyImplyLeading: false,
      title: isMobile
          ? _MobileAppBar(
              name: name,
              onScrollToSection: _scrollToSection,
            )
          : _DesktopAppBar(
              name: name,
              onScrollToSection: _scrollToSection,
            ),
    );
  }
}

class _DesktopAppBar extends StatelessWidget {
  final String name;
  final void Function(GlobalKey) onScrollToSection;

  const _DesktopAppBar({
    required this.name,
    required this.onScrollToSection,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
        child: Row(
          children: [
            Text(
              name,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            _NavItem(
              label: context.tr('aboutMe'),
              onTap: () => onScrollToSection(aboutMeKey),
            ),
            const SizedBox(width: 20),
            _NavItem(
              label: context.tr('experience'),
              onTap: () => onScrollToSection(experienceKey),
            ),
            const SizedBox(width: 20),
            _NavItem(
              label: context.tr('projects'),
              onTap: () => onScrollToSection(projectsKey),
            ),
            const SizedBox(width: 20),
            _NavItem(
              label: context.tr('contact'),
              onTap: () => onScrollToSection(contactsKey),
            ),
            const SizedBox(width: 20),
            const _LanguageDropdown(),
          ],
        ),
      );
}

class _MobileAppBar extends StatelessWidget {
  final String name;
  final void Function(GlobalKey) onScrollToSection;

  const _MobileAppBar({
    required this.name,
    required this.onScrollToSection,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const _LanguageDropdown(),
          const SizedBox(width: 4),
          PopupMenuButton<GlobalKey>(
            icon: const Icon(Icons.menu, size: 22),
            padding: EdgeInsets.zero,
            onSelected: (key) => onScrollToSection(key),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: aboutMeKey,
                child: Text(context.tr('aboutMe')),
              ),
              PopupMenuItem(
                value: experienceKey,
                child: Text(context.tr('experience')),
              ),
              PopupMenuItem(
                value: projectsKey,
                child: Text(context.tr('projects')),
              ),
              PopupMenuItem(
                value: contactsKey,
                child: Text(context.tr('contact')),
              ),
            ],
          ),
        ],
      );
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            label,
            style: context.theme.textTheme.bodyMedium,
          ),
        ),
      );
}

class _LanguageDropdown extends StatelessWidget {
  const _LanguageDropdown();

  @override
  Widget build(BuildContext context) => BlocBuilder<AppBloc, AppState>(
        builder: (ctx, state) => SizedBox(
          width: 55,
          height: 30,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: context.themeColor.cardBackground,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
            ),
            child: DropdownButton<String>(
              icon: const Icon(Icons.language, size: 18)
                  .paddingOnly(left: 6),
              value: state.locale.languageCode,
              padding: const EdgeInsets.only(left: 6),
              underline: const SizedBox.shrink(),
              style: TextStyle(
                color: context.themeColor.textPrimary,
                fontSize: 14,
                fontFamily: 'Montserrat',
              ),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('En')),
                DropdownMenuItem(value: 'ru', child: Text('Ru')),
                DropdownMenuItem(value: 'uz', child: Text('Uz')),
              ],
              onChanged: (v) {
                if (v != null) {
                  context.read<AppBloc>().add(ChangeLanguageEvent(Locale(v)));
                  context
                      .read<HomeBloc>()
                      .add(GetInitialData(languageCode: v));
                }
              },
            ),
          ),
        ),
      );
}
