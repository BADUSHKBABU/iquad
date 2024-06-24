import 'package:flutter/Material.dart';
import 'package:mainapp/iibase/controllers/IITRN.dart';
import 'package:mainapp/iibase/custom%20widgets/IIButton.dart';
import 'package:mainapp/iibase/custom%20widgets/IINUMERICTEXTFIELD.dart';
import 'package:mainapp/iibase/custom%20widgets/IITextEditingControllerValueListenable.dart';
import 'package:mainapp/iibase/custom%20widgets/IITextEditingcontroller.dart';
import 'package:mainapp/iibase/custom%20widgets/IiLabel.dart';
import 'package:mainapp/iibase/transaction.dart';

import '../iibase/custom widgets/IiOKMessage.dart';

class pop_up extends StatefulWidget {
  pop_up({super.key});

  @override
  State<pop_up> createState() => _pop_upState();
}

class _pop_upState extends State<pop_up> {
  iTrnController namecontroller = iTrnController(iiTransaction());
  iTrnController agecontroller = iTrnController(iiTransaction());
  iTrnController numbercontroller=iTrnController(iiTransaction());
  @override
  void initState() {
    // TODO: implement initState
    namecontroller.value.setData("name", 1, "Name", "IQUAD");
    numbercontroller.value.setDataNumeric("number table", 1, "number", 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IILabel(label: "name",),
          IITextEditingControllerValueListenable(oncompleted: (){
            showDialog(context: context, builder: (context){return IIOkMessage(label: "${namecontroller.value.getData("name", 1, "Name")}");});
          },
            // ontap: ()
            // {
            //   showDialog(context: context, builder: (context){return IIOkMessage(label: "${namecontroller.value.getData("name", 1, "Name")}");});
            // },
            valuecontroller: namecontroller,
            onchanged: (value){
              setState((){
                namecontroller.value.setData("name", 1, "Name", value!);
              });
            },
          ),
          IINumericTextField(valuecontroller: numbercontroller, onsubmitted: (value){numbercontroller.value.setDataNumeric("number table", 1,"number",double.parse(value!));
          },
          number: "${numbercontroller.value.getData("number table", 1, "number")}",),
          ElevatedButton(onPressed: (){

          }, child: IILabel(label: "ok",)),
          IIButton(onpress: (){

          }, Child: IILabel(label: "submit",))
        ],
      ),
    );
  }
}
