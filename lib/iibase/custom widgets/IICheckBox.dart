import 'package:flutter/material.dart';

class IICheckBox extends StatefulWidget {
  final ValueNotifier<bool> controller;
  final String caption;

  IICheckBox({
    Key? key,
    required this.controller,
    this.caption = "",
  }) : super(key: key);

  @override
  State<IICheckBox> createState() => _IICheckBoxState();
}

class _IICheckBoxState extends State<IICheckBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.controller,
      builder: (context, value, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: value,
                onChanged: (bool? b) {
                  widget.controller.value = b!;
                },
              ),
              if (widget.caption.isNotEmpty) Text(widget.caption), // Check for non-empty caption
            ],
          ),
        );
      },
    );
  }
}
