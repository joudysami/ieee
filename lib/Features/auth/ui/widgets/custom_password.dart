import 'package:flutter/material.dart';
import 'package:ieee/core/constant/app_color.dart';

class CustomPassword extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomPassword({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.label,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColor.black),
            ),
          ),

          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorHeight: 25,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 0),

            decoration: InputDecoration(
              hintText: widget.hintText,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),

              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
