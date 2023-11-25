import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  const AppTextFormField({
    super.key,
    this.labelText,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    bool? obscureText = isPassword;
    return StatefulBuilder(builder: (context, state) {
      return TextFormField(
        onChanged: onChanged,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          suffixIcon: isPassword!
              ? IconButton(
                  onPressed: () {
                    state(() {
                      obscureText = !obscureText!;
                    });
                  },
                  icon: Icon(
                    obscureText!
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash_fill,
                  ),
                )
              : null,
        ),
        validator: validator,
      );
    });
  }
}
