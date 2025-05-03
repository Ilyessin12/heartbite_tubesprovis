import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingItem({
    Key? key,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.grayLight,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing ?? const Icon(Icons.chevron_right, size: 20),
          ],
        ),
      ),
    );
  }
}
