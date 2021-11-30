import 'package:flutter/cupertino.dart';
import 'package:havartye/constents/constant.dart';
import 'package:http/http.dart' as http;
class BalanceTransferController{

static Future<http.Response> requestThenResponsePrint(BuildContext context ,String token, param) async {

String domain = apiDomainRoot;

var url = '$domain/api/balance-transfer?amount=$param';
var response = await http.get(Uri.parse(url),
headers: {
"Accept": "application/json",
'Authorization': 'Bearer $token',
},
);
return response;
}

}