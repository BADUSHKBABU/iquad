import 'package:flutter/Material.dart';
import '../transaction.dart';
class IIComboBox extends StatefulWidget {
  final ValueNotifier<iiTransaction> controller;
  IIComboBox({super.key, required this.controller});
  @override
  State<IIComboBox> createState() => _IIComboBoxState();
}
class _IIComboBoxState extends State<IIComboBox> {
  String ?_selectedvalue;
  @override
  Widget build(BuildContext context) {
    return
      Container(height: 500,width: 500,
          child: ListView.builder(
              itemCount: widget.controller.value.recordCount("combo"),
              itemBuilder: (context,index)
              {
                return RadioListTile<String>(
                    title: Text(widget.controller.value.getData("combo", index, "combobox")),
                    value: widget.controller.value.getData("combo", index, "combobox"),
                    groupValue:_selectedvalue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedvalue =value;
                      });
                    }
                );
              }
          )
      );
  }
}