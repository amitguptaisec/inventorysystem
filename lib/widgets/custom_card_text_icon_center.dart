import 'package:flutter/material.dart';
import 'package:inventorysystem/theme/app_colors.dart';

import '../theme/app_text_styles.dart';
import 'custom_text_widget.dart';

class CustomCardTextIconCenter extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const CustomCardTextIconCenter({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 140,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: AppColors.primaryDark),
                const SizedBox(height: 12),
                CustomText(text: title, textsyle: AppTextStyles.w60018),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
