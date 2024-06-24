import 'package:flutter/Material.dart';

class IILabel extends StatelessWidget {
  String label;
  Color ?color;
  int ?maxline;
  double ?fontsize;
  TextAlign ?textAlign;
   IILabel({super.key, this.label="",this.color=Colors.black12,this.fontsize=16,this.maxline=100,this.textAlign=TextAlign.left});
  @override
  Widget build(BuildContext context)
  {
    return Text(label,style: TextStyle(color: color,fontSize: fontsize,),maxLines: maxline,textAlign: textAlign);
  }
}

