import 'package:flutter/material.dart';

class WebBottomWidget extends StatelessWidget {
  const WebBottomWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.2,
              vertical: 24),
          child: Center(
            child: Text(
              '© 2024 DevOp. All rights reserved.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      );
}
