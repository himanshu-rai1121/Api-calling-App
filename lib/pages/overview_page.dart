import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  void initState() {
    super.initState();

    // fetch data from api
    getData();
  }

  String? stringResponse;
  Map? mapresponse;

  Future getData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapresponse = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          mapresponse == null
              ? Container()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Sector',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'Industry',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'Market Cap.',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'Enterprise Value (EV)',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'Book Value / Share',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'Price-Earning Ratio (PE)',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'PEG Ratio',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'Dividend',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
          mapresponse == null
              ? Container()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "🏛" + mapresponse!['Sector'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      "🏚" + mapresponse!['Industry'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      mapresponse!['MCAP'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    // ignore: prefer_if_null_operators
                    Text(
                      mapresponse!['EV'].toString() == "null"
                          ? "-"
                          : mapresponse!['EV'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      mapresponse!['BookNavPerShare'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      mapresponse!['TTMPE'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      mapresponse!['PEGRatio'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      mapresponse!['Yield'].toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
