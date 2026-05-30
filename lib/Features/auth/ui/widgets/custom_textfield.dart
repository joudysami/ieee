import 'package:flutter/material.dart';
import 'package:ieee/core/constant/app_color.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.validator,
  });
  final String hintText;
  final String labelText;

  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              labelText,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColor.black),
            ),
          ),
          TextFormField(
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(height: 2.5),

            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorHeight: 30,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
