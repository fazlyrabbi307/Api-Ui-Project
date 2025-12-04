import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApi {

   getaData() async{
    Uri url = Uri.parse("https://appapi.coderangon.com/api/slider");
    var response = await http.get(url);
        return ;
  }

}