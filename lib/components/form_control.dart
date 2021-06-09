import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/constants.dart';

class FormControl extends StatefulWidget {
  final String? label;
  final bool? isValid;
  final TextInputType? keyboardType;
  final bool? obscure;

  const FormControl({
    this.label,
    this.isValid,
    this.keyboardType,
    this.obscure,
    Key? key,
  }) : super(key: key);

  @override
  _FormControlState createState() => _FormControlState();
}

class _FormControlState extends State<FormControl> {
  final String _svgDone = 'assets/icons/done.svg';

  final String _svgEyeVisible = 'assets/icons/eye-visible.svg';

  final String _svgEyeInvisible = 'assets/icons/eye-invisible.svg';

  bool _showPassword = false;

  @override
  void initState() {
    _showPassword = widget.obscure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Text(
                widget.label!.toUpperCase(),
                style: TextStyle(
                  color: kGrayColor,
                  height: 1,
                ),
              ),
              Spacer(),
              if (widget.obscure == true)
                GestureDetector(
                  child: SvgPicture.asset(
                    _showPassword == true ? _svgEyeVisible : _svgEyeInvisible,
                  ),
                  onTap: () => setState(() => _showPassword = !_showPassword),
                )
            ],
          ),
        TextField(
          style: bodyStyle,
          obscuringCharacter: "*",
          cursorColor: kPrimaryColor,
          decoration: textfieldStyle.copyWith(
            suffix: widget.isValid == true
                ? SvgPicture.asset(_svgDone, color: kPrimaryColor)
                : null,
          ),
          keyboardType: widget.keyboardType,
          obscureText: _showPassword,
        ),
      ],
    );
  }
}
