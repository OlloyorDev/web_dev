import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:web_devop/features/home/presentation/pages/mobile/home_mobile_page.dart';
import 'package:web_devop/features/home/presentation/pages/web/home_web_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) =>
      foundation.kIsWeb ? const HomeWebPage() : const HomeMobilePage();
}
