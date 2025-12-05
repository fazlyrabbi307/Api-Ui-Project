import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class PostApi {

  getaData() async{
    try{
      Uri url = Uri.parse("https://appapi.coderangon.com/api/slider");
      var response = await http.get(url);
      return ;
    }catch(error){
      log("$error");
    }
    return {};
  }
}