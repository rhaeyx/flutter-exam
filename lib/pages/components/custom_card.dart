import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.title,
      this.description,
      this.child,
      this.footer,
      this.padding,
      this.backgroundColor,
      this.radius,
      this.border,
      this.shadows,
      this.width,
      this.height,
      this.leading,
      this.trailing,
      this.rowMainAxisAlignment,
      this.rowCrossAxisAlignment,
      this.columnMainAxisAlignment,
      this.columnCrossAxisAlignment,
      this.rowMainAxisSize,
      this.columnMainAxisSize,
      this.photos});

  final Widget? title;
  final Widget? description;
  final Widget? child;
  final Widget? footer;
  final Widget? photos;

  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final Border? border;
  final List<BoxShadow>? shadows;
  final double? width;
  final double? height;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisAlignment? rowMainAxisAlignment;
  final CrossAxisAlignment? rowCrossAxisAlignment;
  final MainAxisAlignment? columnMainAxisAlignment;
  final CrossAxisAlignment? columnCrossAxisAlignment;
  final MainAxisSize? rowMainAxisSize;
  final MainAxisSize? columnMainAxisSize;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectivePadding =
        padding ?? theme.cardTheme.padding ?? const EdgeInsets.all(24);
    final effectiveBackgroundColor = backgroundColor ??
        theme.cardTheme.backgroundColor ??
        theme.colorScheme.card;
    final effectiveRadius = radius ?? theme.cardTheme.radius ?? theme.radius;
    final effectiveBorder = border ??
        theme.cardTheme.border ??
        Border.all(color: theme.colorScheme.border);
    final effectiveShadows = shadows ?? theme.cardTheme.shadows;

    final effectiveRowMainAxisSize =
        rowMainAxisSize ?? theme.cardTheme.rowMainAxisSize ?? MainAxisSize.min;

    final effectiveRowMainAxisAlignment = rowMainAxisAlignment ??
        theme.cardTheme.rowMainAxisAlignment ??
        MainAxisAlignment.spaceBetween;

    final effectiveRowCrossAxisAlignment = rowCrossAxisAlignment ??
        theme.cardTheme.rowCrossAxisAlignment ??
        CrossAxisAlignment.start;

    final effectiveColumnMainAxisSize = columnMainAxisSize ??
        theme.cardTheme.columnMainAxisSize ??
        MainAxisSize.min;

    final effectiveColumnMainAxisAlignment = columnMainAxisAlignment ??
        theme.cardTheme.columnMainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveColumnCrossAxisAlignment = columnCrossAxisAlignment ??
        theme.cardTheme.columnCrossAxisAlignment ??
        CrossAxisAlignment.start;

    return Container(
      width: width,
      height: height,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveRadius,
        border: effectiveBorder,
        boxShadow: effectiveShadows,
      ),
      child: Row(
        mainAxisSize: effectiveRowMainAxisSize,
        mainAxisAlignment: effectiveRowMainAxisAlignment,
        crossAxisAlignment: effectiveRowCrossAxisAlignment,
        children: [
          if (leading != null) leading!,
          Flexible(
            child: Column(
              children: [
                Row(
                  children: [
                    photos!,
                    const SizedBox(width: 18),
                    Column(
                      mainAxisSize: effectiveColumnMainAxisSize,
                      crossAxisAlignment: effectiveColumnCrossAxisAlignment,
                      mainAxisAlignment: effectiveColumnMainAxisAlignment,
                      children: [
                        if (title != null)
                          DefaultTextStyle(
                            style: theme.textTheme.h3.copyWith(
                                color: theme.colorScheme.cardForeground),
                            child: title!,
                          ),
                        const SizedBox(height: 12),
                        if (description != null)
                          DefaultTextStyle(
                            style: theme.textTheme.muted,
                            child: description!,
                          ),
                        const SizedBox(height: 12),
                        if (child != null) child!,
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
                if (footer != null) footer!,
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
