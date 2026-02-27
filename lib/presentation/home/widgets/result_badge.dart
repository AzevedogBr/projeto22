import 'package:flutter/material.dart';

class ResultBadge extends StatelessWidget {
  final bool isPerfect;
  final String message;

  const ResultBadge({
    super.key,
    required this.isPerfect,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPerfect ? const Color(0xFFFFD600) : Colors.white30;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(
            isPerfect ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: color,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ),
          if (!isPerfect)
            Tooltip(
              message:
                  'Um número perfeito é igual à soma\nde seus divisores próprios.\nEx: 6 = 1 + 2 + 3',
              triggerMode: TooltipTriggerMode.tap,
              showDuration: const Duration(seconds: 4),
              child: Icon(
                Icons.info_outline_rounded,
                color: color.withValues(alpha: 0.7),
                size: 18,
              ),
            ),
        ],
      ),
    );
  }
}
