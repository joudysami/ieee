import 'package:flutter/material.dart';
import 'package:ieee/core/constant/app_color.dart';

class CustomButtonGoogle extends StatelessWidget {
  const CustomButtonGoogle({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          side: BorderSide(color: AppColor.black, width: 1),
          backgroundColor: AppColor.white,
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 110),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.g_mobiledata, color: AppColor.black, size: 30),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: AppColor.black, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
