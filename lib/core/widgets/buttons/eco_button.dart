import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// The `EcoButton` is a custom Flutter widget that provides a stylized button
/// with a gradient background and customizable dimensions. It is designed to offer
/// a flexible and visually appealing button option for applications, especially
/// those following the eco-sphere theme.

class EcoButton extends StatelessWidget {
  /// A callback function that is triggered when the button is pressed.
  final VoidCallback onPressed;

  /// The text label displayed on the button.
  final String text;

  /// The width of the button, defaulting to 200 pixels.
  final double? width;

  /// The height of the button, defaulting to 60 pixels.
  final double? height;

  /// The border radius of the button, defaulting to 10 pixels,
  /// providing rounded corners.
  final double borderRadius;

  /// A list of colors used to create the gradient background of the button,
  /// defaulting to a gradient from [AppColors.main] to [AppColors.glen].
  final List<Color> gradientColors;

  const EcoButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.borderRadius = 10,
    this.gradientColors = const [AppColors.main, AppColors.glen],
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    final double maxWidth = MediaQuery.sizeOf(context).width * (isTablet ? 0.6 : 0.8);
    final buttonHeight = height ?? screenSize.height * 0.06;
    return Container(
      // The button's container provides the background gradient and dimensions.
      width: maxWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        // Rounded corners with a customizable border radius.
        borderRadius: BorderRadius.circular(borderRadius),
        // Gradient background transitioning from one color to another.
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        // Handles the button's functionality and content.
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Applies the same border radius to the button shape.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        // The text style is consistent with the app's overall typography.
        child: Text(
          text,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
