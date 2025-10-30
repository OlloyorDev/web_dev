import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/core/util/app_utils.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';
import 'package:web_devop/features/home/presentation/widgets/web/web_bottom_widget.dart';
import 'package:web_devop/features/home/presentation/widgets/web/web_section_item.dart';

final GlobalKey aboutMeKey = GlobalKey();
final GlobalKey experienceKey = GlobalKey();
final GlobalKey projectsKey = GlobalKey();
final GlobalKey contactsKey = GlobalKey();

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({super.key});

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
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
                            child: const Text('About me')),
                        const SizedBox(width: 20),
                        InkWell(
                            onTap: () => _scrollToSection(experienceKey),
                            child: const Text('Experience')),
                        const SizedBox(width: 20),
                        InkWell(
                            onTap: () {
                              _scrollToSection(projectsKey);
                            },
                            child: const Text('Projects')),
                        const SizedBox(width: 20),
                        InkWell(
                            onTap: () {
                              _scrollToSection(contactsKey);
                            },
                            child: const Text('Contacts')),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            final mode =
                                context.read<AppBloc>().state.themeMode ==
                                        ThemeMode.light
                                    ? ThemeMode.dark
                                    : ThemeMode.light;
                            context
                                .read<AppBloc>()
                                .add(ChangeThemeEvent(mode));
                          },
                          child: const Icon(Icons.sunny),
                        ),
                      ],
                    ).paddingOnly(
                      left:  MediaQuery.of(context).size.width * 0.2,
                      right:  MediaQuery.of(context).size.width * 0.2,
                      bottom: 5,
                    ),
                  ),
                ),
                WebSectionWrapper(
                  title: 'About Me',
                  sectionKey: aboutMeKey,
                  subtitle: aboutMeSection,
                  onTap: () => _scrollToSection(aboutMeKey),
                ),
                AppUtils.kSliverGap16,
                WebSectionWrapper(
                  title: 'Experience',
                  subtitle: experienceSection,
                  sectionKey: experienceKey,
                  onTap: () => _scrollToSection(experienceKey),
                ),
                AppUtils.kSliverGap16,
                WebSectionWrapper(
                  title: 'Projects',
                  subtitle: projectsSection,
                  sectionKey: projectsKey,
                  onTap: () => _scrollToSection(projectsKey),
                ),
                AppUtils.kSliverGap16,
                WebSectionWrapper(
                  title: 'Contacts',
                  subtitle: contactsSection,
                  sectionKey: contactsKey,
                  onTap: () => _scrollToSection(contactsKey),
                ),
                AppUtils.kSliverGap16,
                const WebBottomWidget(),
              ],
            ),
          );
        },
      );
}

String aboutMeSection = '''
Hello! I'm Olloyor Nodirov, a passionate Flutter developer with a knack for creating beautiful and functional mobile applications. With a strong foundation in Dart and Flutter, I specialize in building cross-platform apps that deliver seamless user experiences.
''';
// sample experience and projects sections
String experienceSection = '''
I have worked on several projects ranging from small business apps to large-scale applications. My experience includes collaborating with cross-functional teams, implementing state management solutions, and optimizing app performance.
''';
String projectsSection = '''
Here are some of the projects I've worked on:
1. Project A - A social networking app that connects people with similar interests.
2. Project B - An e-commerce platform that offers a seamless shopping experience.
3. Project C - A productivity app that helps users manage their tasks efficiently.
''';
String contactsSection = '''
You can reach me at: olloyornodiro1999@gmail.com";
''';
