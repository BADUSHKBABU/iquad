import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';

import '../transaction.dart';

class IITextEditingController extends StatelessWidget {
  TextEditingController textEditingController;
  final ValueNotifier<iiTransaction>? controller;
  bool readonly;
  Color Iconcolor;
  String HintText;
  double sizedboxheight;
  double paddingtop;
  double paddingleft;
  double paddingright;
  double paddingbottom;
  void Function(String?) ?onchanged;
  IconButton ?suffixicon;
  bool obsecure;
  String?Function(String?) ?validatefunction ;
  //Icon ?SuffixIcon;
  // String ?initialvalue;
  IITextEditingController(

      {super.key,
      required this.textEditingController,
      this.controller,
      this.readonly = false,
      this.Iconcolor = Colors.black,
      this.HintText = "",
      this.sizedboxheight = 0,
      this.paddingbottom=0,
      this.paddingright=0,
      this.paddingleft=0,
      this.paddingtop=0,
      this.onchanged,
        this.obsecure=false,
        this.suffixicon,
        this.validatefunction
      });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller!,
        builder: (context, value, _){
          return Column(
            children: [
              SizedBox(
                height: sizedboxheight,
              ),
              Padding(
                padding:  EdgeInsets.only(left: paddingleft,right: paddingright,bottom: paddingbottom,top: paddingtop),
                child: TextFormField(
                  validator:validatefunction ,
                  controller: textEditingController,
                  readOnly: readonly,
                  onChanged: onchanged,
                  obscureText: obsecure,
                  decoration: InputDecoration(
                      suffixIcon: suffixicon,
                      iconColor: Iconcolor,
                      hintText: HintText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ],
          );
        });
  }
}
