import 'dart:math';

import 'package:flutter/widgets.dart';

/// add Padding Property to widget
extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);
}

/// Add margin property to widget
extension WidgetMarginX on Widget {
  Widget marginAll(double margin) =>
      Container(margin: EdgeInsets.all(margin), child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Container(
    margin: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
    child: this,
  );

  Widget get marginZero => Container(margin: EdgeInsets.zero, child: this);
}

extension TimeFormatExtension on int {
  String timeFormat() {
    final minutes = (this ~/ 60).toString().padLeft(2, '0');
    final seconds = (this % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < 600;

  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  bool get isDesktop => screenWidth >= 1024;

  double get horizontalPadding {
    if (isMobile) return 16;
    if (isTablet) return 40;
    return screenWidth * 0.15;
  }

  EdgeInsets get responsiveHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: horizontalPadding);

  Size get kSize => MediaQuery.sizeOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
}

extension CheckPhoneOrEmail on String? {
  bool get checkEmail {
    if (this == null) return false;
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(this!);
  }

  bool get checkPhoneNumber {
    if (this == null) return false;
    final phoneRegex = RegExp(r'^\+?\d{9,15}$');
    return phoneRegex.hasMatch(this!);
  }
}

extension ListExt<T> on List<T> {
  T? get firstIfNotEmpty => isNotEmpty ? first : null;

  T? get lastIfNotEmpty => isNotEmpty ? last : null;

  T? get random => isNotEmpty ? this[Random().nextInt(length)] : null;
}

extension NumExtension on num {
  String get priceFormat {
    String numStr = toString();
    RegExp reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return numStr.replaceAllMapped(reg, (Match match) => ' ');
  }
}
