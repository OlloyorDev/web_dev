import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/core/util/app_utils.dart';
import 'package:web_devop/features/home/data/model/resume_model.dart';
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
                          context.read<HomeBloc>().add(const GetInitialData()),
                      child: Text(context.tr('retry')),
                    ),
                  ],
                ),
              ),
            );
          }

          final data = state.resumeData;
          final info = data.personalInfo;

          return SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: MaterialTextSelectionControls(),
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  WebAppbar(name: info?.fullName ?? ''),

                  // Hero / About Me
                  WebSectionWrapper(
                    title: context.tr('aboutMe'),
                    sectionKey: aboutMeKey,
                    content: _AboutSection(info: info),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Experience
                  WebSectionWrapper(
                    title: context.tr('experience'),
                    sectionKey: experienceKey,
                    content: _ExperienceSection(experiences: data.experience),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Projects
                  WebSectionWrapper(
                    title: context.tr('projects'),
                    sectionKey: projectsKey,
                    content: _ProjectsSection(projects: data.projects),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Skills
                  if (data.skills != null)
                    WebSectionWrapper(
                      title: context.tr('skills'),
                      sectionKey: GlobalKey(),
                      content: _SkillsSection(skills: data.skills!),
                    ),
                  if (data.skills != null)
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Education
                  if (data.education.isNotEmpty)
                    WebSectionWrapper(
                      title: context.tr('education'),
                      sectionKey: GlobalKey(),
                      content: _EducationSection(education: data.education),
                    ),
                  if (data.education.isNotEmpty)
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Achievements
                  if (data.achievements.isNotEmpty)
                    WebSectionWrapper(
                      title: context.tr('achievements'),
                      sectionKey: GlobalKey(),
                      content:
                          _AchievementsSection(achievements: data.achievements),
                    ),
                  if (data.achievements.isNotEmpty)
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Languages
                  if (data.languages.isNotEmpty)
                    WebSectionWrapper(
                      title: context.tr('languages'),
                      sectionKey: GlobalKey(),
                      content: _LanguagesSection(languages: data.languages),
                    ),
                  if (data.languages.isNotEmpty)
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Contact
                  WebSectionWrapper(
                    title: context.tr('contact'),
                    sectionKey: contactsKey,
                    content: _ContactSection(info: info),
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

// ─── About ───────────────────────────────────────────────────────────────────

class _AboutSection extends StatelessWidget {
  final PersonalInfo? info;

  const _AboutSection({this.info});

  @override
  Widget build(BuildContext context) {
    if (info == null) return const SizedBox.shrink();
    final isMobile = context.isMobile;
    final hasAvatar = info!.avatar != null && info!.avatar!.isNotEmpty;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasAvatar) ...[
          CircleAvatar(
            radius: isMobile ? 36 : 48,
            backgroundImage: NetworkImage(info!.avatar!),
            backgroundColor: context.themeColor.divider,
          ),
          SizedBox(width: isMobile ? 16 : 24),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (info!.title != null && info!.title!.isNotEmpty)
                Text(
                  info!.title!,
                  style: context.theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 18 : 22,
                  ),
                ),
              if (info!.summary != null && info!.summary!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  info!.summary!,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
                ),
              ],
              if (info!.location != null && info!.location!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 16, color: context.themeColor.textSecondary),
                    const SizedBox(width: 4),
                    Text(info!.location!,
                        style: context.theme.textTheme.bodySmall),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Skills ──────────────────────────────────────────────────────────────────

class _SkillsSection extends StatelessWidget {
  final Skills skills;

  const _SkillsSection({required this.skills});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final groups = <Widget>[
      if (skills.primary.isNotEmpty)
        _SkillChipGroup(
          label: context.tr('primarySkills'),
          items: skills.primary,
          color: context.colorScheme.primary,
        ),
      if (skills.secondary.isNotEmpty)
        _SkillChipGroup(
          label: context.tr('secondarySkills'),
          items: skills.secondary,
          color: context.colorScheme.secondary,
        ),
      if (skills.tools.isNotEmpty)
        _SkillChipGroup(
          label: context.tr('tools'),
          items: skills.tools,
          color: context.themeColor.textSecondary,
        ),
    ];

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < groups.length; i++) ...[
            groups[i],
            if (i < groups.length - 1) const SizedBox(height: 16),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < groups.length; i++) ...[
          Expanded(child: groups[i]),
          if (i < groups.length - 1) const SizedBox(width: 24),
        ],
      ],
    );
  }
}

class _SkillChipGroup extends StatelessWidget {
  final String label;
  final List<String> items;
  final Color color;

  const _SkillChipGroup({
    required this.label,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.themeColor.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items
              .map((s) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: color.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      s,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontSize: 13,
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

// ─── Experience ──────────────────────────────────────────────────────────────

class _ExperienceSection extends StatelessWidget {
  final List<ExperienceItem> experiences;

  const _ExperienceSection({required this.experiences});

  @override
  Widget build(BuildContext context) {
    if (experiences.isEmpty) return const SizedBox.shrink();

    return Column(
      children: experiences.map((exp) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (exp.position != null)
                          Text(
                            exp.position!,
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        if (exp.company != null)
                          Text(
                            exp.company!,
                            style: context.theme.textTheme.bodyMedium,
                          ),
                      ],
                    ),
                  ),
                  if (exp.dateRange.isNotEmpty)
                    Text(
                      exp.dateRange,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        color: context.themeColor.textSecondary,
                      ),
                    ),
                ],
              ),
              if (exp.employmentType != null) ...[
                const SizedBox(height: 2),
                Text(
                  exp.employmentType!,
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    color: context.themeColor.textSecondary,
                  ),
                ),
              ],
              if (exp.responsibilities.isNotEmpty) ...[
                const SizedBox(height: 8),
                ...exp.responsibilities.map((r) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6, right: 8),
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.themeColor.textSecondary,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              r,
                              style: context.theme.textTheme.bodySmall
                                  ?.copyWith(height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
              if (exp.technologies.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: exp.technologies
                      .map((t) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: context.colorScheme.primary
                                  .withValues(alpha: 0.1),
                            ),
                            child: Text(t,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: context.colorScheme.primary,
                                )),
                          ))
                      .toList(),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ─── Projects ────────────────────────────────────────────────────────────────

class _ProjectsSection extends StatefulWidget {
  final List<ProjectItem> projects;

  const _ProjectsSection({required this.projects});

  @override
  State<_ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<_ProjectsSection> {
  bool _expanded = false;
  static const _initialCount = 3;

  @override
  Widget build(BuildContext context) {
    if (widget.projects.isEmpty) return const SizedBox.shrink();

    final showToggle = widget.projects.length > _initialCount;
    final visibleProjects = _expanded
        ? widget.projects
        : widget.projects.take(_initialCount).toList();

    return Column(
      children: [
        ...visibleProjects.map((project) {
          final hasIos =
              project.iosAppLink != null && project.iosAppLink!.isNotEmpty;
          final hasAndroid = project.androidAppLink != null &&
              project.androidAppLink!.isNotEmpty;

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (project.name != null)
                            Text(
                              project.name!,
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          if (project.role != null)
                            Text(
                              project.role!,
                              style: context.theme.textTheme.bodyMedium,
                            ),
                        ],
                      ),
                    ),
                    if (project.dateRange.isNotEmpty)
                      Text(
                        project.dateRange,
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: context.themeColor.textSecondary,
                        ),
                      ),
                  ],
                ),
                if (project.description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    project.description!,
                    style: context.theme.textTheme.bodySmall
                        ?.copyWith(height: 1.5),
                  ),
                ],
                if (project.technologies.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies
                        .map((t) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: context.colorScheme.primary
                                    .withValues(alpha: 0.1),
                              ),
                              child: Text(t,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: context.colorScheme.primary,
                                  )),
                            ))
                        .toList(),
                  ),
                ],
                if (hasIos || hasAndroid) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (hasIos)
                        _StoreButton(
                          icon: Icons.apple,
                          label: 'App Store',
                          url: project.iosAppLink!,
                        ),
                      if (hasIos && hasAndroid) const SizedBox(width: 8),
                      if (hasAndroid)
                        _StoreButton(
                          icon: Icons.shop,
                          label: 'Play Market',
                          url: project.androidAppLink!,
                        ),
                    ],
                  ),
                ],
              ],
            ),
          );
        }),
        if (showToggle)
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              child: Text(
                _expanded
                    ? context.tr('showLess')
                    : '${context.tr('showMore')} (${widget.projects.length - _initialCount})',
                style: TextStyle(
                  color: context.colorScheme.primary,
                  fontSize: 14,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ─── Education ───────────────────────────────────────────────────────────────

class _EducationSection extends StatelessWidget {
  final List<Education> education;

  const _EducationSection({required this.education});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: education.map((edu) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.school_outlined,
                  size: 20, color: context.themeColor.textSecondary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (edu.institution != null)
                      Text(edu.institution!,
                          style: context.theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                    if (edu.degree != null || edu.fieldOfStudy != null)
                      Text(
                        [edu.degree, edu.fieldOfStudy]
                            .where((e) => e != null && e.isNotEmpty)
                            .join(' - '),
                        style: context.theme.textTheme.bodySmall,
                      ),
                    if (edu.startYear != null)
                      Text(
                        '${edu.startYear} — ${edu.endYear ?? 'Present'}',
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: context.themeColor.textSecondary,
                        ),
                      ),
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

// ─── Achievements ────────────────────────────────────────────────────────────

class _AchievementsSection extends StatelessWidget {
  final List<String> achievements;

  const _AchievementsSection({required this.achievements});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: achievements
          .map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: context.colorScheme.primary,
                  ),
                  AppUtils.kGap4,
                  Expanded(
                    child: Text(
                      a,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

// ─── Languages ───────────────────────────────────────────────────────────────

class _LanguagesSection extends StatelessWidget {
  final List<LanguageItem> languages;

  const _LanguagesSection({required this.languages});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: languages.map((lang) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.themeColor.divider, width: 0.5),
          ),
          child: Column(
            children: [
              Text(lang.name ?? '',
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(lang.level ?? '', style: context.theme.textTheme.bodySmall),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ─── Contact ─────────────────────────────────────────────────────────────────

class _ContactSection extends StatelessWidget {
  final PersonalInfo? info;

  const _ContactSection({this.info});

  @override
  Widget build(BuildContext context) {
    if (info == null) return const SizedBox.shrink();

    final items = <_ContactItem>[
      if (info!.email != null && info!.email!.isNotEmpty)
        _ContactItem(
            Icons.email_outlined, info!.email!, 'mailto:${info!.email!}'),
      if (info!.phone != null && info!.phone!.isNotEmpty)
        _ContactItem(Icons.phone_outlined, info!.phone!, 'tel:${info!.phone!}'),
      if (info!.website != null && info!.website!.isNotEmpty)
        _ContactItem(
            Icons.language, info!.website!, 'https://${info!.website!}'),
      if (info!.github != null && info!.github!.isNotEmpty)
        _ContactItem(Icons.code, info!.github!, 'https://${info!.github!}'),
      if (info!.linkedin != null && info!.linkedin!.isNotEmpty)
        _ContactItem(
            Icons.work_outline, info!.linkedin!, 'https://${info!.linkedin!}'),
    ];

    if (items.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: items
          .map(
            (item) => InkWell(
              onTap: () => launchUrl(Uri.parse(item.url)),
              borderRadius: BorderRadius.circular(4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(item.icon,
                      size: 18, color: context.themeColor.textSecondary),
                  const SizedBox(width: 8),
                  Text(item.value, style: context.theme.textTheme.bodySmall),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ContactItem {
  final IconData icon;
  final String value;
  final String url;

  const _ContactItem(this.icon, this.value, this.url);
}

// ─── Store Button ─────────────────────────────────────────────────────────────

class _StoreButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: context.themeColor.divider),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: context.themeColor.textSecondary),
            const SizedBox(width: 6),
            Text(
              label,
              style: context.theme.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: context.themeColor.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
