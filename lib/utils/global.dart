import 'dart:convert';
import 'dart:math' as math;


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


// class Globals {
//   labelWidget(String label, BuildContext context) {
//     return Row(
//       children: [
//         Globals().horizontalSpace(12),
//         Text(label,
//             style: AppTextStyles(context)
//                 .fourteen500TStar()
//                 .copyWith(fontWeight: FontWeight.w600)),
//       ],
//     );
//   }
//
//   Widget horizontalSpace(double width) {
//     return SizedBox(width: width);
//   }
//
//   Widget verticalSpace(double height) {
//     return SizedBox(height: height);
//   }
//
//   InputDecoration textFieldDecorationForMobileNumberField(
//    String label,/**/
//       BuildContext context, {
//         bool? showIcon,
//     TextStyle? prefixIconStyle,/**/
//     Function? onCountryCodeTap,}
//      ) {
//     return InputDecoration(
//       contentPadding: EdgeInsets.symmetric(horizontal: 16),
//       prefixIcon: GestureDetector(
//         onTap: () {
//           onCountryCodeTap != null ? onCountryCodeTap() : () {};
//         },
//         child: Container(
//           color: Colors.transparent,
//           padding: EdgeInsets.only(
//               left: label.isNotEmpty ? 16 : 0, right: 0, top: 1),
//           width: (label.isNotEmpty &&
//                   label != AppLocalizations.of(context)!.currency)
//               ? label.length == 3
//                   ? (70 - ((showIcon ?? true) ? 0 : 25))
//                   : (80 - ((showIcon ?? true) ? 0 : 25))
//               : 16,
//           child: Row(
//             children: [
//               Text(label,
//                   style: prefixIconStyle ??
//                       AppTextStyles(context).sixteen700TStarSecondary()),
//               if (label.isNotEmpty &&
//                   label != AppLocalizations.of(context)!.currency && (showIcon ?? true)) ...[
//                 Icon(Icons.keyboard_arrow_down_rounded,
//                     color: Theme.of(context).colorScheme.primary)
//               ],
//             ],
//           ),
//         ),
//       ),
//       prefixIconConstraints: BoxConstraints(
//           minWidth: (label.isNotEmpty &&
//                   label != AppLocalizations.of(context)!.currency)
//               ? 50
//               : 30),
//       filled: true,
//       fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.16),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(
//           color: Theme.of(context).colorScheme.secondary,
//           width: 1,
//         ),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(
//           color: Theme.of(context).colorScheme.secondary,
//           width: 1,
//         ),
//       ),
//       disabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(
//           color: Theme.of(context).colorScheme.secondary,
//           width: 1,
//         ),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(
//           color: Theme.of(context).colorScheme.primary,
//           width: 1,
//         ),
//       ),
//     );
//   }
//
//   InputDecoration textFieldDecorationForSearchField(
//     String label,
//     BuildContext context,
//     bool hasFocus,
//     Function removeFocus,
//   ) {
//     var state = context.watch<ThemeBloc>().state;
//     bool isDark = true;
//     if (state is ThemeLight) {
//       isDark = false;
//     }
//     return InputDecoration(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//       hintText: label,
//       hintStyle: AppTextStyles(context).sixteen700TStar(),
//       suffixIcon: GestureDetector(
//         onTap: hasFocus
//             ? () {
//                 removeFocus();
//               }
//             : null,
//         child: Container(
//           color: Colors.transparent,
//           padding: const EdgeInsets.only(right: 16),
//           child: SvgPicture.asset(hasFocus ? close : search,
//               color: Theme.of(context).colorScheme.surface),
//         ),
//       ),
//       suffixIconConstraints: const BoxConstraints(maxWidth: 66),
//       filled: true,
//       fillColor: isDark
//           ? Theme.of(context).colorScheme.surface.withOpacity(0.16)
//           : Theme.of(context).colorScheme.onPrimary,
//       focusedBorder: hasFocus
//           ? OutlineInputBorder(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(8)),
//               borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.secondary,
//                 width: 1,
//               ),
//             )
//           : OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.secondary,
//                 width: 1,
//               ),
//             ),
//       enabledBorder: hasFocus
//           ? OutlineInputBorder(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(8)),
//               borderSide: BorderSide(
//                 color: isDark
//                     ? Theme.of(context).colorScheme.secondary
//                     : Theme.of(context).colorScheme.onPrimary,
//                 width: 1,
//               ),
//             )
//           : OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: isDark
//                     ? Theme.of(context).colorScheme.secondary
//                     : Theme.of(context).colorScheme.onPrimary,
//                 width: 1,
//               ),
//             ),
//       disabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(
//           color: isDark
//               ? Theme.of(context).colorScheme.secondary
//               : Theme.of(context).colorScheme.onPrimary,
//           width: 1,
//         ),
//       ),
//     );
//   }
//
//   Gradient containerGradient() {
//     return LinearGradient(
//       colors: [
//         Colors.white.withOpacity(0.2),
//         Colors.white.withOpacity(0.2),
//         /*gradientColor*/ Colors.white.withOpacity(0.2),
//         Colors.white.withOpacity(0.2),
//       ],
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     );
//   }
//
//   sessionLogout(BuildContext context) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (_) => SessionLogoutPopup()
//     );
//   }
//
//   showRelevantError(String error, BuildContext context, {String? toastmsg}) {
//     String errorMsg=toastmsg??error;
//     var locale = AppLocalizations.of(context);
//     if (error.contains("Failed host lookup")) {
//       ToastUtil.showToast(message: "     ${locale?.noInternet ?? " "}    ");
//     } else {
//       ToastUtil.showToast(message: errorMsg);
//     }
//   }
// }

class CustomGradientProgressBarWithText extends StatelessWidget {
  final double progress;
  final Color progressStartColor;
  final Color progressEndColor;
  final double strokeWidth;
  final double size;
  final String firstText;
  final TextStyle firstTextStyle;
  final String secondText;
  final TextStyle secondTextStyle;

  const CustomGradientProgressBarWithText({
    super.key,
    required this.progress,
    required this.progressStartColor,
    required this.progressEndColor,
    required this.strokeWidth,
    required this.size,
    required this.firstText,
    required this.secondText,
    required this.firstTextStyle,
    required this.secondTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size.square(size),
          painter: _CustomGradientProgressBarPainter(
            progress: progress,
            progressStartColor: progressStartColor,
            progressEndColor: progressEndColor,
            strokeWidth: strokeWidth,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstText,
              style: firstTextStyle,
            ),
            Visibility(
              visible: (secondText != ''),
              child: Text(
                secondText,
                style: secondTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomGradientProgressBarPainter extends CustomPainter {
  final double progress;
  final Color progressStartColor;
  final Color progressEndColor;
  final double strokeWidth;

  _CustomGradientProgressBarPainter({
    required this.progress,
    required this.progressStartColor,
    required this.progressEndColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double angle = 2 * math.pi * progress;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (math.min(size.width, size.height) - strokeWidth) / 2;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    final Gradient gradient = SweepGradient(
      startAngle: 3 * math.pi / 2.1,
      endAngle: 7 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: [
        progressStartColor,
        progressEndColor,
      ],
    );

    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);

    final Paint fullPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..color = progressEndColor;

    final Paint background = Paint()
      ..strokeWidth = strokeWidth + 0.5
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withOpacity(0.17);

    canvas.drawCircle(center, radius, background);
    canvas.drawArc(rect, -math.pi / 2, angle, false, paint);
    if (progress == 1) {
      canvas.drawCircle(center, radius, fullPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GlobalSnackbar {
  static show(BuildContext context, String? message, Color backgroundColor) {
    // Remove any existing snackbar before showing a new one
    ScaffoldMessenger.of(context).clearSnackBars();

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.8,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message ?? "",
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

class ToastUtil {
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    int timeInSecForIosWeb = 1,
    double fontSize = 14.0,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
