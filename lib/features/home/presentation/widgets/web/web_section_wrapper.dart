import 'package:flutter/material.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';

class WebSectionWrapper extends StatelessWidget {
  final String title;
  final Widget? content;
  final GlobalKey sectionKey;

  const WebSectionWrapper({
    super.key,
    required this.title,
    this.content,
    required this.sectionKey,
  });

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          key: sectionKey,
          margin: context.responsiveHorizontalPadding,
          decoration: BoxDecoration(
            color: context.themeColor.cardBackground,
            border: Border.all(
              color: context.themeColor.divider,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(context.isMobile ? 16 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  fontSize: context.isMobile ? 20 : 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              if (content != null) content!,
            ],
          ),
        ),
      );
}
