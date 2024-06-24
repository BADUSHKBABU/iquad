import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:mainapp/iibase/custom%20widgets/IiLabel.dart';

import '../transaction.dart';

class IINumericTextField extends StatelessWidget {
  bool ?isborder=true;
  final ValueNotifier<iiTransaction>? valuecontroller;
  String ?number;
  void Function(String?)? onsubmitted;

   IINumericTextField({super.key,required this.valuecontroller,this.isborder, this.number,this.onsubmitted});



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: valuecontroller!, builder: (context,value,_){return TextFormField
      (
      onChanged: onsubmitted,
      validator: _validator,

      decoration: InputDecoration(
          border: OutlineInputBorder()
      ),
      //controller: TextEditingController(text: number),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );});

  }
String? _validator(String? value)
{
  if(value==null || value.isEmpty)
    {
      return "field is empty ";
    }
}

}
