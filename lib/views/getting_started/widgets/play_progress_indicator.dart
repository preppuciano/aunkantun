import 'package:aukantun/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class PlayProgressIndicator extends StatefulWidget {
  final Function? onTap;
  final double? progress;
  const PlayProgressIndicator({
    super.key,
    this.onTap,
    this.progress,
  });

  @override
  State<PlayProgressIndicator> createState() => _PlayProgressIndicatorState();
}

class _PlayProgressIndicatorState extends State<PlayProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    if (widget.progress != null) {
      return CustomPaint(
        painter: CircleProgressPainter(
          borderWidth: 22,
          borderColor: Colors.transparent,
          progressPercentage: widget.progress!, // Pasar el progreso
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.softWhite.withOpacity(0.10),
            border: Border.all(
              color: AppColor.softWhite.withOpacity(0.10),
              width: 2,
            ),
          ),
          child: IconButton(
            color: AppColor.charcoalColor,
            onPressed: () => widget.onTap?.call(),
            icon: const Icon(
              Icons.play_circle_fill_rounded,
              size: 200,
              color: AppColor.softWhite,
            ),
          ),
        ),
      );
    }
    return WidgetAnimator(
      atRestEffect: WidgetRestingEffects.size(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.softWhite.withOpacity(0.10),
          border: Border.all(
            color: AppColor.softWhite.withOpacity(0.10),
            width: 2,
          ),
        ),
        child: IconButton(
          color: AppColor.charcoalColor,
          onPressed: () => widget.onTap?.call(),
          icon: const Icon(
            Icons.play_circle_fill_rounded,
            size: 200,
            color: AppColor.softWhite,
          ),
        ),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double borderWidth;
  final Color borderColor;
  final double progressPercentage; // Guardar el progreso

  CircleProgressPainter({
    required this.borderWidth,
    required this.borderColor,
    required this.progressPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBorder = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Dibuja el círculo con borde
    canvas.drawCircle(size.center(Offset.zero),
        size.width / 2 - borderWidth / 2, paintBorder);

    // Calcular el ángulo del progreso
    double angle =
        2 * 3.141592653589793 * progressPercentage; // 360 grados en radianes

    Paint paintProgress = Paint()
      ..color = Colors.green // Color del progreso
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Dibuja el arco que representa el progreso
    canvas.drawArc(
      Rect.fromCircle(
          center: size.center(Offset.zero),
          radius: size.width / 2 - borderWidth / 2),
      -3.141592653589793 / 2, // Comienza desde la parte superior (12 en punto)
      angle, // Ángulo del progreso
      false, // No cerrar el arco
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
