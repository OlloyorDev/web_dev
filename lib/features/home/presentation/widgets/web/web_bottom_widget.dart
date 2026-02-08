import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';

class WebBottomWidget extends StatelessWidget {
  const WebBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding,
          vertical: 24,
        ),
        child: isMobile
            ? Column(
                children: [
                  Text(
                    'Designed & Developed by Olloyor Nodirov',
                    style: context.theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Used Flutter for Web',
                    style: context.theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const ThemeChangeWidget(),
                ],
              )
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Designed & Developed by Olloyor Nodirov',
                        style: context.theme.textTheme.bodySmall,
                      ),
                      Text(
                        'Used Flutter for Web',
                        style: context.theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const ThemeChangeWidget(),
                ],
              ),
      ),
    );
  }
}

class ThemeChangeWidget extends StatelessWidget {
  const ThemeChangeWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.themeColor.cardBackground,
            border: Border.all(
              color: context.themeColor.textPrimary,
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ThemeItemCard(
                title: context.tr('light'),
                active: state.themeMode.isLight,
                onTap: () => _setUpThemeMode(context, ThemeMode.light),
              ),
              const SizedBox(width: 4),
              _ThemeItemCard(
                title: context.tr('dark'),
                active: state.themeMode.isDark,
                onTap: () => _setUpThemeMode(context, ThemeMode.dark),
              ),
              const SizedBox(width: 4),
              _ThemeItemCard(
                title: context.tr('auto'),
                active: state.themeMode.isSystem,
                onTap: () => _setUpThemeMode(context, ThemeMode.system),
              )
            ],
          ).paddingAll(3),
        ),
      );

  void _setUpThemeMode(BuildContext context, ThemeMode mode) {
    context.read<AppBloc>().add(ChangeThemeEvent(mode));
  }
}

class _ThemeItemCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool active;

  const _ThemeItemCard({
    required this.title,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: active ? context.themeColor.textPrimary : Colors.transparent,
            border: active
                ? Border.all(
                    color: context.themeColor.white,
                    width: 0.5,
                  )
                : null,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: active
                  ? context.themeColor.background
                  : context.themeColor.textPrimary,
            ),
          ).paddingSymmetric(horizontal: 4, vertical: 2),
        ),
      );
}
