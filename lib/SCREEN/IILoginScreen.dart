
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:mainapp/SCREEN/pop_up.dart';
import '../iibase/controllers/IITRN.dart';
import '../iibase/custom widgets/IIButton.dart';
import '../iibase/custom widgets/IIColumn.dart';
import '../iibase/custom widgets/IIContainer.dart';
import '../iibase/custom widgets/IIRow.dart';
import '../iibase/custom widgets/IITextEditingcontroller.dart';
import '../iibase/custom widgets/IiLabel.dart';
import '../iibase/custom widgets/IiOKMessage.dart';
import '../iibase/custom widgets/IiYesNoMessage.dart';
import '../iibase/datavehicle.dart';
import '../iibase/transaction.dart';

class IILoginScreen extends StatefulWidget {
  IILoginScreen({super.key});

  @override
  State<IILoginScreen> createState() => _IILoginScreenState();
}

class _IILoginScreenState extends State<IILoginScreen> {
  iTrnController usernametextcontroller = iTrnController(iiTransaction());

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  bool masked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: IIColumn(IChildren: [
          Expanded(
            child: IIContainer(
              containercolor: Colors.blueGrey,
              Child: IIContainer(
                  paddingright: 400,
                  paddingleft: 50,
                  paddingbottom: 100,
                  paddingtop: 200,
                  containercolor: Colors.grey,
                  Child: IIColumn(
                    IChildren: [
                      IIRow(
                        IChildren: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: IILabel(
                              label: "Username",
                              textAlign: TextAlign.center,
                              fontsize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: IITextEditingController(
                              textEditingController: username,
                              sizedboxheight: 30,
                              paddingright: 20,
                              paddingleft: 50,
                              controller:usernametextcontroller,
                            ),
                          ),
                        ],
                      ),
                      IIRow(
                        IChildren: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: IILabel(
                              label: "Password",
                              textAlign: TextAlign.center,
                              fontsize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: IITextEditingController(
                              validatefunction: (data){
                                if(data!.isNotEmpty){
                                  IIYesNoMessage();
                                }
                              },
                              obsecure: !masked,
                              sizedboxheight: 30,
                              paddingright: 20,
                              paddingleft: 50,
                              suffixicon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      masked = !masked;
                                    });
                                  },
                                  icon: masked
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off_sharp)),
                              controller: usernametextcontroller,
                              textEditingController: password,
                            ),
                          ),
                        ],
                      ),
                    IIButton(paddingright: 300,
                      onpress: ()async{
                      validate();
                    passwordEncryption(password.text);
                    print("button preesed");
                     if(validate()==false){
                       print("button preesed2");
                       return ;
                     }
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return pop_up();}));
                    print("button preesed3");
                     DataVehicle d=DataVehicle();
                     iiTransaction trn=iiTransaction();
                     trn.setP("pwd",passwordEncryption(password.text));
                     trn.setP("username","administrator");
                     trn.setP("branchcode","");
                     iiTransaction result= await d.getData("tripsheet.login", trn);
                    print("button preesed4");
                     print(result.toJSON());
                    },Child:IILabel(label: "Login",) ,paddingleft: 10,paddingtop: 10,)
                    ],
                  )),
            ),
          )
        ]));
  }

  bool validate(){

    if(username.text.isEmpty || password.text.isEmpty){

      showDialog(context: context, builder: (context){return IIOkMessage(label: "user name/pASSWORD is empty");});
      print("usesrnmae/password is empty");
      return false;
    }
    // if(password.text.isEmpty){
    //   showDialog(context: context, builder: (context){return IIOkMessage(label: "password cant be empty");});
    //   print("Password is emty");
    //   return false;
    // }
    return true;


  }

  String passwordEncryption(String password ) {
     return md5.convert(utf8.encode(password)).toString();
    //print("encrypted password is : ${md5.convert(utf8.encode(password)).toString()}");
  }
}


