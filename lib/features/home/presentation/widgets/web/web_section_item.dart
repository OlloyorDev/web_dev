import 'package:flutter/material.dart';
import 'package:web_devop/common/extension/app_extensions.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';

class WebSectionWrapper extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? content;
  final GlobalKey sectionKey;
  final VoidCallback onTap;

  const WebSectionWrapper({
    super.key,
    required this.title,
    this.subtitle,
    this.content,
    required this.sectionKey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            key: sectionKey,
            decoration: BoxDecoration(
              color: context.themeColor.cardBackground,
              border: Border.all(
                color: context.themeColor.background,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                if (content != null) content!
              ],
            ).paddingAll(12),
          ),
        ).paddingSymmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
      );
}
