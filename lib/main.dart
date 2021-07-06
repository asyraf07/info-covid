// Dart Library
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Model
import 'package:info_covid/model/corona_model.dart';
import 'package:info_covid/model/corona_model_list.dart';

// Mobile View
import 'package:info_covid/mobile_view/home.dart';
import 'package:info_covid/mobile_view/provinsi.dart';
import 'package:info_covid/mobile_view/about.dart';

// Web View
import 'package:info_covid/web_view/home.dart';
import 'package:info_covid/web_view/provinsi.dart';
import 'package:info_covid/web_view/about.dart';

//Styling
import 'package:info_covid/style/my_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info Covid',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff142E57, {
          50: Color.fromRGBO(4, 131, 184, .1),
          100: Color.fromRGBO(4, 131, 184, .2),
          200: Color.fromRGBO(4, 131, 184, .3),
          300: Color.fromRGBO(4, 131, 184, .4),
          400: Color.fromRGBO(4, 131, 184, .5),
          500: Color.fromRGBO(4, 131, 184, .6),
          600: Color.fromRGBO(4, 131, 184, .7),
          700: Color.fromRGBO(4, 131, 184, .8),
          800: Color.fromRGBO(4, 131, 184, .9),
          900: Color.fromRGBO(4, 131, 184, 1),
        }),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(title: 'Info Covid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  var totalCasesIndonesia;
  var totalCasesProvinsi;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    totalCasesIndonesia = fetchDataCoronaIndonesia();
    totalCasesProvinsi = fetchDataCoronaProvinsi();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetMobileOptions = <Widget>[
      HomeMobilePage(
        cases: totalCasesIndonesia,
      ),
      ProvinsiMobilePage(
        cases: totalCasesProvinsi,
      ),
      AboutMobilePage(),
    ];

    List<Widget> _widgetWebOptions = <Widget>[
      HomeWebPage(
        cases: totalCasesIndonesia,
      ),
      ProvinsiWebPage(
        cases: totalCasesProvinsi,
      ),
      AboutWebPage(),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth <= 600) {
            return Center(
              child: _widgetMobileOptions[_currentIndex],
            );
          } else {
            return Center(
              child: _widgetWebOptions[_currentIndex],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Provinsi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'About',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: MyColor.primary,
      ),
    );
  }
}
