import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:mainapp/iibase/transaction.dart';

class DataVehicle
{

  String login_userid="";
  String login_branchid="";

  Future<iiTransaction> getData(String method, iiTransaction trn) async
  {
    try {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      Uri url = Uri.parse('http://195.201.41.88:10909/go/erp');
      String requestBodyJson = jsonEncode(trn.toJSON());
      HttpClientRequest request = await httpClient.postUrl(url);
      request.headers.add('methodname', method);
      request.headers.add('jsonv', '2');
      request.headers.set('Content-Type', 'application/json');
      request.headers.set('Accept', 'application/json');
      request.headers.set('branchid', iqencryption(login_branchid));
      request.headers.set('userid', iqencryption(login_userid));
      request.headers.set('trefid', iqencryption(''));
      request.headers.set('irefid', iqencryption(''));
      request.headers.set('tguid', iqencryption(''));
      request.headers.set( 'iguid', iqencryption(''));
      request.headers.set('macid', iqencryption(''),);
      request.headers.set('token', iqencryption(''));
      request.headers.set('dot', iqencryption(''));
      request.headers.set('tot', iqencryption(''),);
      request.headers.set('cKeccak', iqencryption(''));
      request.headers.set('dKeccak', iqencryption(''));
      request.headers.set('eKeccak', iqencryption(''));
      request.write(requestBodyJson);
      HttpClientResponse response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      String _responseData = utf8.decode(bytes);
      print(_responseData);
      iiTransaction result= iiTransaction();
      result.fromJson(_responseData);
      return result;
    } catch (e) {
      //iiTransaction trn = new iiTransaction();
      // r.clear();
      // t.clear();
      // trn.clear();
      // r.addField('type', '-1');
      // r.addField('message', e.toString());
      // t.addRecord(r);
      // trn.addTable('result', t);
      // clbk_responseReceived(trn);
      print('Data vehicle error: ' + e.toString());
      return iiTransaction();
    }
  }
  String iqencryption(String val){
    final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = encrypt.Key.fromUtf8('12345678901234567890123456789012');
    final iv = encrypt.IV.fromUtf8('1234567890123456');
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: null));
    final encrypted = encrypter.encrypt(val, iv: iv);
    //final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return encrypted.toString();
  }
}