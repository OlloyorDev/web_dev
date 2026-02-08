import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/features/home/data/model/home_model.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';
import 'package:web_devop/features/home/presentation/widgets/web/web_appbar.dart';
import 'package:web_devop/features/home/presentation/widgets/web/web_bottom_widget.dart';
import 'package:web_devop/features/home/presentation/widgets/web/web_section_wrapper.dart';

final GlobalKey aboutMeKey = GlobalKey();
final GlobalKey experienceKey = GlobalKey();
final GlobalKey projectsKey = GlobalKey();
final GlobalKey contactsKey = GlobalKey();

class HomeWebPage extends StatelessWidget {
  const HomeWebPage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.getStatus.loading || state.getStatus.initial) {
            return const Scaffold(
              body: Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(strokeWidth: 3),
                ),
              ),
            );
          }

          if (state.getStatus.error) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: context.themeColor.textSecondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.tr('error'),
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () =>
                          context.read<HomeBloc>().add(GetInitialData()),
                      child: Text(context.tr('retry')),
                    ),
                  ],
                ),
              ),
            );
          }

          final data = state.homeData;

          return SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: MaterialTextSelectionControls(),
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  WebAppbar(
                    name: data.aboutMe?.name?.text ?? '',
                  ),
                  WebSectionWrapper(
                    title: context.tr('aboutMe'),
                    sectionKey: aboutMeKey,
                    content: _AboutMeContent(aboutMe: data.aboutMe),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  WebSectionWrapper(
                    title: context.tr('experience'),
                    sectionKey: experienceKey,
                    content: _ExperienceContent(
                      experiences: data.experiences ?? [],
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  WebSectionWrapper(
                    title: context.tr('projects'),
                    sectionKey: projectsKey,
                    content: _ProjectsContent(
                      projects: data.projects ?? [],
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  WebSectionWrapper(
                    title: context.tr('contact'),
                    sectionKey: contactsKey,
                    content: _ContactsContent(
                      contacts: data.contacts ?? [],
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  const WebBottomWidget(),
                ],
              ),
            ),
          );
        },
      );
}

class _AboutMeContent extends StatelessWidget {
  final AboutMe? aboutMe;

  const _AboutMeContent({this.aboutMe});

  @override
  Widget build(BuildContext context) {
    final ab = aboutMe;
    if (ab == null) return const SizedBox.shrink();

    final isMobile = context.isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ab.image != null) ...[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(
                ab.image!,
                width: isMobile ? 100 : 140,
                height: isMobile ? 100 : 140,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => CircleAvatar(
                  radius: isMobile ? 50 : 70,
                  child: const Icon(Icons.person, size: 40),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (ab.title != null)
          Text(
            ab.title!.text,
            style: context.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        if (ab.description != null) ...[
          const SizedBox(height: 8),
          Text(
            ab.description!.text,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ],
    );
  }
}

class _ExperienceContent extends StatelessWidget {
  final List<Experience> experiences;

  const _ExperienceContent({required this.experiences});

  @override
  Widget build(BuildContext context) {
    if (experiences.isEmpty) return const SizedBox.shrink();

    return Column(
      children: experiences.map((exp) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (exp.companyImage != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      exp.companyImage!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: context.themeColor.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.business, size: 24),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (exp.title != null)
                      Text(
                        exp.title!.text,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (exp.companyName != null)
                      Text(
                        exp.companyName!,
                        style: context.theme.textTheme.bodySmall,
                      ),
                    if (exp.date != null)
                      Text(
                        exp.date!,
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: context.themeColor.textSecondary,
                        ),
                      ),
                    if (exp.description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        exp.description!.text,
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          height: 1.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _ProjectsContent extends StatelessWidget {
  final List<Projects> projects;

  const _ProjectsContent({required this.projects});

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) return const SizedBox.shrink();

    final isMobile = context.isMobile;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: projects.map((project) {
        return SizedBox(
          width: isMobile
              ? double.infinity
              : (context.screenWidth * 0.7 - 64) / 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.themeColor.background,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (project.image != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Image.network(
                      project.image!,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 180,
                        color: context.themeColor.background,
                        child: const Center(
                          child: Icon(Icons.image, size: 40),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (project.title != null)
                        Text(
                          project.title!.text,
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (project.duration != null)
                        Text(
                          project.duration!,
                          style: context.theme.textTheme.bodySmall,
                        ),
                      if (project.description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          project.description!.text,
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            height: 1.5,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ContactsContent extends StatelessWidget {
  final List<Contact> contacts;

  const _ContactsContent({required this.contacts});

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: contacts.map((contact) {
        return ActionChip(
          avatar: contact.icon != null
              ? const Icon(Icons.link, size: 18)
              : null,
          label: Text(contact.title ?? ''),
          onPressed: () {},
        );
      }).toList(),
    );
  }
}
