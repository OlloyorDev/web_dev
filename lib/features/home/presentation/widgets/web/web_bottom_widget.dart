import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/core/util/app_utils.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';

class WebBottomWidget extends StatelessWidget {
  const WebBottomWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
            vertical: 24,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Designed & Developed by Olloyor Nodirov',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Used Flutter for Web',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              AppUtils.kSpacer,
              const ThemeChangeWidget(),
            ],
          ),
        ),
      );
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
            children: [
              _ThemeItemCard(
                title: context.tr('light'),
                active: state.themeMode.isLight,
                onTap: () => _setUpThemeMode(context, ThemeMode.light),
              ),
              AppUtils.kGap4,
              _ThemeItemCard(
                title: context.tr('dark'),
                active: state.themeMode.isDark,
                onTap: () => _setUpThemeMode(context, ThemeMode.dark),
              ),
              AppUtils.kGap4,
              _ThemeItemCard(
                title: context.tr('auto'),
                active: state.themeMode.isSystem,
                onTap: () => _setUpThemeMode(context, ThemeMode.system),
              )
            ],
          ).paddingAll(3),
        ),
      );

  _setUpThemeMode(BuildContext context, ThemeMode mode) {
    context.read<AppBloc>().add(ChangeThemeEvent(mode));
  }
}

class _ThemeItemCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool active;

  const _ThemeItemCard({
    super.key,
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
