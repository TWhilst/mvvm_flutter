import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? errorTxt;
  const AppError({Key? key, this.errorTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorTxt && errorTxt!.isNotEmpty,
      child: Container(
        child: Text(
          errorTxt!,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
