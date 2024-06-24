
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import '../iibase/controllers/BoolController.dart';
import '../iibase/controllers/IIDateTimeController.dart';
import '../iibase/controllers/IITRN.dart';
import '../iibase/custom widgets/IICheckBox.dart';
import '../iibase/custom widgets/IIComboBox.dart';
import '../iibase/custom widgets/IINUMERICTEXTFIELD.dart';
import '../iibase/custom widgets/IIDateAndTime.dart';
import '../iibase/custom widgets/IITextEditingControllerValueListenable.dart';
import '../iibase/custom widgets/IiLabel.dart';
import '../iibase/custom widgets/IiOKMessage.dart';
import '../iibase/custom widgets/IiWarningMessage.dart';
import '../iibase/transaction.dart';
class IIHomeScreen extends StatefulWidget {
  IIHomeScreen({super.key});
  @override
  State<IIHomeScreen> createState() => _IIHomeScreenState();
}
class _IIHomeScreenState extends State<IIHomeScreen> {
  IIDateController calendernotifier= IIDateController(DateTime.now());
  iTrnController multicheckcontroller = iTrnController(iiTransaction());
  iTrnController numericcontroller = iTrnController(iiTransaction());
  BoolController checkboxcontroller = BoolController(true);
  TextEditingController numbercontroller = TextEditingController();
  iTrnController labelcontroller = iTrnController(iiTransaction());
  iTrnController textcontroller = iTrnController(iiTransaction());
  iTrnController combocontroller = iTrnController(iiTransaction());
  bool ispressed = false;
  String? changedvalue;
  String dt="";
  TextEditingController textEditingController=TextEditingController();
  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      multicheckcontroller.value.setDataB("list", i, "title", false);
      multicheckcontroller.value.setData("list", i, "title", "iquad$i");
    }
    combocontroller.value.setData("combo", 0, "combobox", "option 1");
    combocontroller.value.setData("combo", 1, "combobox", "option 2");
    combocontroller.value.setData("combo", 2, "combobox", "option 3");
    labelcontroller.value.setData("test label", 1, "name", "initial value");
    super.initState();
    calendernotifier.addListener(() {
setState((){
  dt="${calendernotifier.datetime}";
});
    });
  }
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: formkey,
            child: IINumericTextField(valuecontroller: numericcontroller, ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  checkboxcontroller.value = !checkboxcontroller.value;
                  multicheckcontroller.value.setData("list", 3, "title", "test");
                  print(multicheckcontroller.value.getData("list", 3, "title"));
                  print(multicheckcontroller.value.getData("list", 3, "title"));
                           }
                        );
              },
              child: Text("ok")),
          Expanded(child: IIDateAndTime(DateAndTimeController: calendernotifier,IsDateOnly: true,)),
          ///combo box
          Expanded(child: IIComboBox(controller: combocontroller,)),
          ElevatedButton(onPressed: (){
            calendernotifier.datetime=DateTime(2025,2,24);
            //timenotifier.datetime=DateTime.now();
            }, child:IILabel(label: "${dt}",)),
          // Expanded(
          //     child: IiLabelEditingController(
          //   controller: labelcontroller,
          //   label: "${labelcontroller.value.getData("test label", 1, "name")}",
          //   onchanged: (String? value) {
          //     setState(() {
          //       changedvalue = value;
          //       labelcontroller.value
          //           .setData("test label", 1, "name", "$value");
          //       labelcontroller.notifyListeners();
          //       print(
          //           "${labelcontroller.value.getData("test label", 1, "name")}");
          //       labelcontroller.notifyListeners();
          //     });
          //   },
          // )),
          // ElevatedButton(
          //     onPressed: () {
          //       setState(() {
          //         ispressed = false;
          //         print(
          //             "changed value by typing on controller  : ${labelcontroller.value.getData("test label", 1, "name")}");
          //         labelcontroller.value
          //             .setData("test label", 1, "name", "$changedvalue");
          //         labelcontroller.notifyListeners();
          //       });
          //     },
          //     child: IILabel(
          //       label: "onclick",
          //       color: Colors.red,
          //     )),
          IILabel(label: "d" ,),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return IIWarningMessage();
                      });
                });
              },
              child: IILabel(
                label: "warning",
              )),
          //ItextController(textEditingController: numbercontroller,controller: labelcontroller,),

        /// dialoguemessage
        ElevatedButton(onPressed: (){
            if( numbercontroller.text=="10"){showDialog(context: context, builder: (context){
              return IIWarningMessage(label: "ok",);
            });}
            else{
              showDialog(context: context, builder: (context){return IIOkMessage(label: "proceed");});
            }
          }, child: IILabel(label: "enter",)),
          
          IITextEditingControllerValueListenable(
            oncompleted: (){
              textcontroller.value.setData("tbl", 1, "field", "hyg");
              textcontroller.notifyListeners();
            },
            onchanged: (String? value){
              textcontroller.value.setData("tbl", 1, "field", "$value");
              //textcontroller.notifyListeners();
              print("changed data is :${textcontroller.value.getData("tbl", 1 , "$value")}");
            },
            valuecontroller: textcontroller,
 ),
          ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder: (context){return IIOkMessage(label: "proceed");});
                if (formkey.currentState!.validate()) {}
              },
              child: IILabel(label: "submit")),
       // Expanded(child: ItextController(textEditingController: textEditingController,controller: labelcontroller,)),
          // ElevatedButton(onPressed: (){
          //   if(textEditingController.text.isEmpty){
          //     showDialog(context: context, builder: (_){return IiErrorMessage();});
          //   }
          // }, child: Iilabel(label: "checking error",)),
          //Expanded(child: IICheckBox(controller: checkboxcontroller)),
        ],
      ),
    );
  }
}
