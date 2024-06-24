// import 'dart:developer';
// import 'package:encrypt/encrypt.dart';
// import 'package:flutter/Cupertino.dart';
//
//
// import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
// import 'dart:typed_data';
// import 'http';
// import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:mainapp/iibase/transaction.dart';
//
// class DataVehicle {
//   void Function(iiTransaction) clbk_responseReceived;
//
//   DataVehicle(this.clbk_responseReceived);
//
//   void post(
//       String method,
//       String json,
//       ) async {
//     try {
//       print(pub_applicationPath);
//       final response = await http.post(Uri.parse(pub_applicationPath),
//           headers: {
//             'Accept': 'application/json',
//             'Access-Control_Allow_Origin': '*',
//             'Access-Control-Allow-Methods': 'GET, POST',
//             'Access-Control-Allow-Credentials': 'true',
//             'Access-Control-Max-Age': '86400',
//             'methodname': iqencryption(method),
//             'branchid': iqencryption(pub_login_branchid.toString()),
//             'userid': iqencryption(pub_login_userid),
//             'trefid': iqencryption(''),
//             'irefid': iqencryption(''),
//             'tguid': iqencryption(''),
//             'iguid': iqencryption(''),
//             'macid': iqencryption(''),
//             'token': iqencryption(''),
//             'dot': iqencryption(''),
//             'tot': iqencryption(''),
//             'cKeccak': iqencryption(''),
//             'dKeccak': iqencryption(''),
//             'eKeccak': iqencryption(''),
//           },
//           body: json);
//
//       iiTransaction t = new iiTransaction();
//       t.fromJSON(response.body);
//       clbk_responseReceived(t);
//     } catch (e) {
//       iiRecord r = new iiRecord();
//       iiTable t = new iiTable();
//       iiTransaction trn = new iiTransaction();
//
//       r.clear();
//       t.clear();
//       trn.clear();
//
//       r.addField('type', '-1');
//       r.addField('message', e.toString());
//       t.addRecord(r);
//       trn.addTable('result', t);
//       clbk_responseReceived(trn);
//       print('Data vehicle error: ' + e.toString());
//     }
//   }
//
//   String iqencryption(String val) {
//     final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
//     final key = encrypt.Key.fromUtf8('12345678901234567890123456789012');
//     final iv = encrypt.IV.fromUtf8('1234567890123456');
//
//     final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: null));
//
//     final encrypted = encrypter.encrypt(val, iv: iv);
//     //final decrypted = encrypter.decrypt(encrypted, iv: iv);
//     return encrypted.toString();
//   }
//
//   void getdata() async {
//     try {
//       HttpClient httpClient = HttpClient();
//       httpClient.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       Uri url = Uri.parse('http://195.201.41.88:10909/go/workbook');
//
//
//
//       iiTransaction trn=iiTransaction();
//
//       trn.setName("sales");
//
//       trn.setData("emp",0, "name", "bijinb");
//       trn.setData("emp",0, "age", "30");
//
//       trn.setData("emp",1, "name", "anoop");
//       trn.setData("emp",1, "age", "50");
//
//
//       print(trn.toJSON());
//
//       String requestBodyJson = jsonEncode(trn.toJSON());
//       HttpClientRequest request = await httpClient.postUrl(url);
//
//
//
//       request.headers.add('methodname', 'test');
//       request.headers.add('jsonv', '2');
//
//       request.headers.set('Content-Type', 'application/json');
//       //request.headers.set('Authorization', 'Bearer YourAccessToken');
//       request.headers.set('Accept', 'application/json');
//
//       // request.headers.set('Access-Control_Allow_Origin', '*');
//       //request.headers.set('Access-Control-Allow-Methods', 'GET, POST');
//       //request.headers.set('Access-Control-Allow-Credentials', 'true');
//       //request.headers.set('Access-Control-Max-Age', '');
//       // if (request is BrowserHttpClientRequest) {
//       //  request.browserCredentialsMode = true;
//       // }
//       //Write body
//       request.write(requestBodyJson);
//       HttpClientResponse response = await request.close();
//
//       Uint8List bytes = await consolidateHttpClientResponseBytes(response);
//
//       setState(() {
//         _responseData = utf8.decode(bytes);
//         print(_responseData);
//         iiTransaction trn= iiTransaction();
//         trn.fromJson(_responseData);
//
//
//
//         print(trn.getData("result",0,"message"));
//         // print(bytes);
//       });
//     } catch (e)
//     {
//       print('Error: $e  : ');
//     }
//   }
//
// }
