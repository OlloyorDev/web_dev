import 'dart:io';
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
  bool get isMobile =>
      MediaQuery.sizeOf(this).width < 600 &&
      (Platform.isAndroid || Platform.isIOS);

  bool get isTablet =>
      MediaQuery.sizeOf(this).width > 600 &&
      (Platform.isAndroid || Platform.isIOS);

  EdgeInsets get kMargin16 => EdgeInsets.only(
    top: MediaQuery.paddingOf(this).top,
    left: isMobile ? 16 : 200,
    right: isMobile ? 16 : 200,
    bottom: MediaQuery.paddingOf(this).bottom,
  );

  EdgeInsets get kMarginBottom16 => EdgeInsets.only(
    bottom: MediaQuery.paddingOf(this).bottom,
    left: isMobile ? 16 : 200,
    right: isMobile ? 16 : 200,
  );

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
    final phoneRegex = RegExp(
      r'^\+?\d{9,15}$',
    ); // e.g. +998901234567 or 998901234567
    return phoneRegex.hasMatch(this!);
  }
}

extension PlatformExt on BuildContext {
  bool get isAndroid => Platform.isAndroid;

  bool get isIOS => Platform.isIOS;
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
