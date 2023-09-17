part of 'utils.dart';

sealed class AppUtils {
  AppUtils._();

  static const kSpacer = Spacer();

  static const kGap = Gap(0);
  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap10 = Gap(10);
  static const kGap12 = Gap(12);
  static const kGap15 = Gap(15);
  static const kGap16 = Gap(16);
  static const kGap20 = Gap(20);
  static const kGap24 = Gap(24);
  static const kGap32 = Gap(32);
  static const kGap40 = Gap(40);
  static const kGap64 = Gap(64);

  /// box
  static const kBox = SizedBox.shrink();

  // static const kBoxWidth4 = SizedBox(width: 4);
  // static const kBoxWidth8 = SizedBox(width: 8);
  // static const kBoxWidth12 = SizedBox(width: 12);
  // static const kBoxWidth16 = SizedBox(width: 16);
  // static const kBoxWidth20 = SizedBox(width: 20);
  // static const kBoxWidth30 = SizedBox(width: 30);
  // static const kBoxWidth40 = SizedBox(width: 40);
  // static const kBoxWidth50 = SizedBox(width: 50);
  // static const kBoxWidth56 = SizedBox(width: 56);
  // static const kBoxHeight2 = SizedBox(height: 2);
  // static const kBoxHeight4 = SizedBox(height: 4);
  // static const kBoxHeight8 = SizedBox(height: 8);
  // static const kBoxHeight12 = SizedBox(height: 12);
  // static const kBoxHeight16 = SizedBox(height: 16);
  // static const kBoxHeight14 = SizedBox(height: 14);
  // static const kBoxHeight20 = SizedBox(height: 20);
  // static const kBoxHeight24 = SizedBox(height: 24);
  // static const kBoxHeight60 = SizedBox(height: 60);

  /// divider
  static const kDivider = Divider(height: 1 ,color: Colors.grey,);

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
  static const kPaddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
  static const kPaddingHorizontal12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHorizontal48 = EdgeInsets.symmetric(horizontal: 48);
  static const kPaddingHorizontal25 = EdgeInsets.symmetric(horizontal: 25);
  static const kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingBottom16 = EdgeInsets.fromLTRB(0, 0, 0, 16);
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);
  static const kPaddingAll16Top0 = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const kPaddingAll16Left0 = EdgeInsets.fromLTRB(0, 16, 16, 16);
  static const kPaddingAll16Right0 = EdgeInsets.fromLTRB(16, 16, 0, 16);
  static const kPaddingHor14Ver16 =
      EdgeInsets.symmetric(horizontal: 14, vertical: 16);
  static const kPaddingVertical8 = EdgeInsets.symmetric(vertical: 8);
  static const kPaddingHor16Ver12 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const kPaddingHor16Ver24 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 24);

  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const kPaddingTop8Bottom8LeftRight16 = EdgeInsets.fromLTRB(16, 8, 16, 8);

  /// border radius
  static const kRadius = Radius.zero;
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius30 = BorderRadius.all(Radius.circular(30));

  static const kShapeRoundedNone = RoundedRectangleBorder();
  static const kShapeRoundedAll12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const kShapeRoundedAll10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
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
  );

  // static EdgeInsets getResponsivePadding1632(BuildContext context) {
  //   if (context.isMobile) {
  //     return const EdgeInsets.symmetric(horizontal: 16);
  //   } else {
  //     return const EdgeInsets.symmetric(horizontal: 32);
  //   }
  // }

  // static Gap getResponsiveGap1632(BuildContext context) {
  //   if (context.isMobile) {
  //     return const Gap(16);
  //   } else {
  //     return const Gap(32);
  //   }
  // }
}
