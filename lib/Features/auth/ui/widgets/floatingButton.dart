import 'package:flutter/material.dart';
import 'package:ieee/core/constant/app_color.dart';

class Floatingactionbuttin extends StatelessWidget {
  const Floatingactionbuttin({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isSelected = false, required String heroTag,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: isSelected ? AppColor.red : AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
        side: BorderSide(color: AppColor.red, width: 1),
      ),
      label: Icon(
        icon,
        color: isSelected ? AppColor.white : AppColor.black,
        size: 25,
      ),
    );
  }
}