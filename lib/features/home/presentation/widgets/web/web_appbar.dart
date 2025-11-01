import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';
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
              Text(
                context.tr('fullName'),
                style: context.theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
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
              BlocBuilder<AppBloc, AppState>(builder: (ctx, state) {
                return SizedBox(
                  width: 55,
                  height: 30,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: context.themeColor.cardBackground,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                    ),
                    child: DropdownButton(
                      icon: const Icon(Icons.language, size: 18)
                          .paddingOnly(left: 6),
                      value: state.locale.languageCode,
                      padding: const EdgeInsets.only(left: 6),
                      underline: const SizedBox.shrink(),
                      style: TextStyle(
                        color: context.themeColor.textPrimary,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(
                            'En',
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'ru',
                          child: Text(
                            'Ru',
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'uz',
                          child: Text(
                            'Uz',
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                      onChanged: (v) => context.read<AppBloc>()
                        ..add(ChangeLanguageEvent(Locale(v!))),
                    ),
                  ),
                );
              }),
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
