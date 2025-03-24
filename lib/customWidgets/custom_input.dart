import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String hint;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomInput({
    super.key,
    required this.hint,
    this.icon,
    this.isPassword = false,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(widget.icon,
                    color: Theme.of(context).iconTheme.color, size: 20),
              ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                obscureText: widget.isPassword && !showPassword,
                cursorHeight: 20,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 2,
                    ),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  suffixIcon: widget.isPassword
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                              showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).iconTheme.color,
                              size: 20),
                        )
                      : null,
                ),
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
