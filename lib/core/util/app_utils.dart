import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum Gender { woman, man }

sealed class AppUtils {
  AppUtils._();

  static const kSpacer = Spacer();

  static const kGap = Gap(0);
  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap10 = Gap(10);
  static const kGap12 = Gap(12);
  static const kGap14 = Gap(14);
  static const kGap15 = Gap(15);
  static const kGap16 = Gap(16);
  static const kGap20 = Gap(20);
  static const kGap24 = Gap(24);
  static const kGap32 = Gap(32);
  static const kGap40 = Gap(40);
  static const kGap64 = Gap(64);

  static const kSliverGap10 = SliverGap(10);
  static const kSliverGap12 = SliverGap(12);
  static const kSliverGap16 = SliverGap(16);
  static const kSliverGap20 = SliverGap(20);
  static const kSliverGap24 = SliverGap(24);
  static const kSliverGap32 = SliverGap(32);

  /// box
  static const kBox = SizedBox.shrink();

  /// padding
  static const kPadding0 = EdgeInsets.zero;
  static const kPaddingAll1 = EdgeInsets.all(1);
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll5 = EdgeInsets.all(5);
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll10 = EdgeInsets.all(10);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingAll24 = EdgeInsets.all(24);
  static const kPaddingHorizontal6 = EdgeInsets.symmetric(horizontal: 6);
  static const kPaddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
  static const kPaddingHorizontal5 = EdgeInsets.symmetric(horizontal: 5);
  static const kPaddingHorizontal2 = EdgeInsets.symmetric(horizontal: 2);
  static const kPaddingHorizontal10 = EdgeInsets.symmetric(horizontal: 10);
  static const kPaddingHorizontal12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHorizontal12Bottom6 = EdgeInsets.only(
    left: 12,
    right: 12,
    bottom: 6,
  );
  static const kPaddingHorizontal16Bottom10 = EdgeInsets.only(
    left: 16,
    right: 16,
    bottom: 10,
  );
  static const kPaddingHorizontal20 = EdgeInsets.symmetric(horizontal: 20);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHorizontal48 = EdgeInsets.symmetric(horizontal: 48);
  static const kPaddingHorizontal25 = EdgeInsets.symmetric(horizontal: 25);
  static const kPaddingHor32Ver20 = EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 20,
  );
  static const kPaddingBottom16 = EdgeInsets.fromLTRB(0, 0, 0, 16);
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);
  static const kPaddingAll16Top0 = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const kPaddingAll16Left0 = EdgeInsets.fromLTRB(0, 16, 16, 16);
  static const kPaddingAll16Right0 = EdgeInsets.fromLTRB(16, 16, 0, 16);
  static const kPaddingHor14Ver16 = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 16,
  );
  static const kPaddingVertical2 = EdgeInsets.symmetric(vertical: 2);
  static const kPaddingVertical4 = EdgeInsets.symmetric(vertical: 4);
  static const kPaddingVertical8 = EdgeInsets.symmetric(vertical: 8);
  static const kPaddingVertical10 = EdgeInsets.symmetric(vertical: 10);
  static const kPaddingVertical12 = EdgeInsets.symmetric(vertical: 12);
  static const kPaddingVertical16 = EdgeInsets.symmetric(vertical: 16);
  static const kPaddingVertical20 = EdgeInsets.symmetric(vertical: 20);
  static const kPaddingVertical25 = EdgeInsets.symmetric(vertical: 25);
  static const kPaddingHor16Ver12 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  static const kPaddingHor12Ver8 = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );
  static const kPaddingHor12Ver4 = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 4,
  );
  static const kPaddingHor8Ver4 = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 4,
  );
  static const kPaddingHor12Ver10 = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 10,
  );
  static const kPaddingHor12Ver16 = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 16,
  );
  static const kPaddingHor16Ver8 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  static const kPaddingHor12Ver3 = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 3,
  );
  static const kPaddingHor16Ver10 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 10,
  );
  static const kPaddingHor16Ver24 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 24,
  );

  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);

  /// border radius
  static const kRadius0 = Radius.zero;
  static const kRadius4 = Radius.circular(4);
  static const kRadius6 = Radius.circular(6);
  static const kRadius8 = Radius.circular(8);
  static const kRadius12 = Radius.circular(12);
  static const kRadius16 = Radius.circular(16);
  static const kRadius20 = Radius.circular(20);
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius6 = BorderRadius.all(Radius.circular(6));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius30 = BorderRadius.all(Radius.circular(30));
  static const kBorderRadius48 = BorderRadius.all(Radius.circular(48));
  static const kBorderRadiusVerticalTop24 = BorderRadius.vertical(
    top: Radius.circular(24),
  );

  static RoundedRectangleBorder bottomSheetShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    ),
  );

  static const kShapeRoundedNone = RoundedRectangleBorder();
  static const kShapeRoundedAll12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
  static const kShapeRoundedAll10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  static const kShapeRoundedBottom12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
    ),
  );

  static BoxDecoration kDecoration = BoxDecoration(
    border: Border.all(color: Colors.black12, width: 1.1),
    borderRadius: BorderRadius.circular(8),
    color: Colors.white,
  );
  static const Widget kCenterLoading = Center(
    child: CircularProgressIndicator.adaptive(),
  );

  static Widget kCenterLoadingWithSliver = const SliverFillRemaining(
    child: Center(child: CircularProgressIndicator.adaptive()),
  );
}
