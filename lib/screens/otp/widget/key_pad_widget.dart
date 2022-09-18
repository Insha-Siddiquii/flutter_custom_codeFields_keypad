import 'package:flutter/material.dart';

class KeyPadWidget extends StatefulWidget {
  const KeyPadWidget({
    Key? key,
    required this.digit,
    required this.onTap,
  }) : super(key: key);

  final String digit;
  final void Function(String) onTap;

  @override
  State<KeyPadWidget> createState() => _KeyPadWidgetState();
}

class _KeyPadWidgetState extends State<KeyPadWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => widget.onTap(widget.digit)),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            widget.digit,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
