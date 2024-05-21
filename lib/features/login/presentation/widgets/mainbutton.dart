import 'package:ecommerce_app/core/color/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/mediaquery.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback ontab;
  final double height;
  const MainButton(
      {Key? key, required this.text, required this.ontab, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth(context),
      height: height,
      child: ElevatedButton(
        onPressed: ontab,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorManager.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
