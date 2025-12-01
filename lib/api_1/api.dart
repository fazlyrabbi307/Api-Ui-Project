
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

 class Api{
   getDataApi ()async{
    var url = Uri.parse("https://appapi.coderangon.com/api/slider");
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}