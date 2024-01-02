import 'package:api_base/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Row(
        children: [
          Text(
            'See all',
            style: AppTextStyles.labelMediumLight,
          ),
          Icon(
            Icons.chevron_right_rounded,
          ),
        ],
      ),
    );
  }
}
