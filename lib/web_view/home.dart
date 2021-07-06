import 'package:flutter/material.dart';
import 'package:info_covid/model/corona_model.dart';
import 'package:info_covid/style/my_color.dart';
import 'package:info_covid/style/my_text.dart';

class HomeWebPage extends StatefulWidget {
  final Future cases;

  HomeWebPage({Key? key, required this.cases}) : super(key: key);

  @override
  _HomeWebPageState createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  var cases;

  @override
  void initState() {
    super.initState();
    cases = widget.cases;
  }

  @override
  Widget build(BuildContext context) {
    final double _iconSize = 300;

    return FutureBuilder(
      future: cases,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          CoronaModel coronaModel = snapshot.data!;
          return ListView(
            children: [
              Container(
                color: Color(0xff142E57),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Center(
                        child: Image.asset('images/partikel_horizontal.png')),
                    Center(child: Image.asset('images/logo.png', width: 450)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Informasi Covid-19 terkini di Indonesia',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Nexa',
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                color: Color(0xFF77DD77),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: 120,
                                  // padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          'images/sembuh.png',
                                          width: 100,
                                          height: 150,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWhiteBold('SEMBUH'),
                                            SizedBox(height: 3),
                                            TextWhiteNumSmall(
                                                coronaModel.sembuh),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color(0xFFFAB657),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: 120,
                                  // padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          'images/positif.png',
                                          width: 100,
                                          height: 150,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWhiteBold('POSITIF'),
                                            SizedBox(height: 3),
                                            TextWhiteNumSmall(
                                                coronaModel.positif),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color(0xFFF66862),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: 120,
                                  // padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          'images/meninggal.png',
                                          width: 100,
                                          height: 150,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWhiteBold('MENINGGAL'),
                                            SizedBox(height: 3),
                                            TextWhiteNumSmall(
                                                coronaModel.meninggal),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(
                              bottom: 0,
                              right: MediaQuery.of(context).size.width * 0.2,
                            ),
                            alignment: Alignment.centerRight,
                            child: Text(
                              '(Last Update ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year})',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Nexa',
                                fontSize: 15,
                                // fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          color: Color(0xff142E57),
                          child: Stack(
                            children: [
                              ClipRect(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  heightFactor: 0.35,
                                  child: Image.asset(
                                    'images/partikel_long.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 70),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'images/5m.png',
                                        width: 600,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'images/5m_1.png',
                                            width: _iconSize,
                                          ),
                                          TextWhiteBoldBig('Memakai Masker'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextWhiteBoldBig('Mencuci Tangan'),
                                          Image.asset(
                                            'images/5m_2.png',
                                            width: _iconSize,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'images/5m_3.png',
                                            width: _iconSize,
                                          ),
                                          TextWhiteBoldBig('Menjaga Jarak'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextWhiteBoldBig(
                                              'Membatasi Mobilitas'),
                                          Image.asset(
                                            'images/5m_4.png',
                                            width: _iconSize,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'images/5m_5.png',
                                            width: _iconSize,
                                            // color: Colors.red,
                                          ),
                                          TextWhiteBoldBig(
                                              'Menjauhi Kerumunan'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Text Protokol Kesehatan
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    // color: Colors.red,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(3),
                      // ),
                      child: Text(
                        'Protokol Kesehatan Pencegahan Covid-19',
                        style: TextStyle(
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
