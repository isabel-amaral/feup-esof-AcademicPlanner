import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'dart:async';

Future<String> getPrintsBalance(http.Response response) async {
  final document = parse(response.body);

  final String balanceString =
      document.querySelector('div#conteudoinner > .info').text;

  final String balance = balanceString.split(': ')[1];

  return balance;
}
