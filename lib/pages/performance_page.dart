import 'package:flutter/material.dart';
import 'package:api_project/models/performance.dart';
import 'package:api_project/services/remote_service.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({Key? key}) : super(key: key);

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  List<Performance>? performance;
  var isLoaded = false;

  get index => null;

  @override
  void initState() {
    super.initState();

    // fetch data from api
    getData();
  }

  getData() async {
    performance = await RemoteService().getPerformance();
    if (performance != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      // child: Text('Hii'),
      child: ListView.builder(
        itemCount: performance?.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: 50,
                  child: FittedBox(child: Text(performance![index].label))),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                height: 20,
                width: 190,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: getfact(performance![index].changePercent),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              if (performance![index].changePercent < 0)
                Text('🔻' +
                    (performance![index].changePercent * -1)
                        .toStringAsFixed(1)),
              if (performance![index].changePercent >= 0)
                Text('🔼' +
                    performance![index].changePercent.toStringAsFixed(1)),
              const SizedBox(
                height: 40,
              ),
            ],
          );
        },
      ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  double gettotal() {
    double total = 0.0;
    for (int i = 0; i < performance!.length; i++) {
      double rr = performance![i].changePercent;
      if (rr < 0) rr = rr * (-1);
      total = total + rr;
    }
    return total;
  }

  double getfact(double changePercent) {
    double p = gettotal();
    p = gettotal();
    double ret = 0.0;
    double r = changePercent;
    if (r < 0) r = r * (-1);
    p == 0.0 ? ret = 0.0 : ret = r / p;

    return ret;
  }
}
