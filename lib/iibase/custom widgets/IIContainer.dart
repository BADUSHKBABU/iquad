import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

class IIContainer extends StatelessWidget {
  double Width;
  double Height;
  Color containercolor;
  Widget? Child;
  double paddingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  IIContainer(
      {super.key,
      this.Width = 1,
      this.Height = 1,
      this.containercolor = Colors.lightBlueAccent,
      this.Child,
      this.paddingtop = 0,
      this.paddingbottom = 0,
      this.paddingright = 0,
      this.paddingleft = 0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingleft,
          right: paddingright,
          top: paddingtop,
          bottom: paddingbottom),
      child: Container(
        width: MediaQuery.of(context).size.width * Width,
        height: MediaQuery.of(context).size.height * Height,
        decoration: BoxDecoration(
          color: containercolor,
        ),
        child: Child,
      ),
    );
  }
}
