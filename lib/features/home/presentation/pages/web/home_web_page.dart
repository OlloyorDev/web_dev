import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/core/util/app_utils.dart';
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
          return SelectableRegion(
            selectionControls: MaterialTextSelectionControls(),
            child: Scaffold(
              body: state.getStatus.loading
                  ? Center(
                      child: Lottie.asset(
                        'assets/lottie/loading.json',
                        height: 50,
                        width: 50,
                      ),
                    )
                  : CustomScrollView(
                      slivers: [
                        const WebAppbar(),
                        WebSectionWrapper(
                          title: context.tr('aboutMe'),
                          sectionKey: aboutMeKey,
                          subtitle: aboutMeSection,
                          onTap: () {},
                        ),
                        AppUtils.kSliverGap16,
                        WebSectionWrapper(
                          title: context.tr('experience'),
                          subtitle: experienceSection,
                          sectionKey: experienceKey,
                          onTap: () {},
                        ),
                        AppUtils.kSliverGap16,
                        WebSectionWrapper(
                          title: context.tr('projects'),
                          subtitle: projectsSection,
                          sectionKey: projectsKey,
                          onTap: () {},
                        ),
                        AppUtils.kSliverGap16,
                        WebSectionWrapper(
                          title: context.tr('contact'),
                          subtitle: contactsSection,
                          sectionKey: contactsKey,
                          onTap: () {},
                        ),
                        AppUtils.kSliverGap16,
                        const WebBottomWidget(),
                      ],
                    ),
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
You can reach me at: olloyornodiro1999@gmail.com;
''';
