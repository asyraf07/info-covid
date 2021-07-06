import 'package:flutter/material.dart';
import 'package:info_covid/model/corona_model.dart';
import 'package:info_covid/style/my_color.dart';
import 'package:info_covid/style/my_text.dart';

class HomeMobilePage extends StatefulWidget {
  final Future cases;
  // final bool isCasesNull;

  HomeMobilePage({Key? key, required this.cases}) : super(key: key);

  // HomePage({Key? key, required this.cases, required this.isCasesNull})
  //     : super(key: key);

  @override
  _HomeMobilePageState createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  var yow;

  @override
  void initState() {
    super.initState();
    yow = widget.cases;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: yow,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          CoronaModel coronaModel = snapshot.data!;
          return ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: MyColor.primary,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      // top: 0,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Image.asset('images/partikel.png'),
                    ),
                    Image.asset(
                      'images/logo.png',
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ],
                ),
              ),
              // Image.asset('images/1.png'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 10.0,
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
                          Card(
                            color: Color(0xFF77DD77),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              // padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        TextWhiteBold('SEMBUH'),
                                        SizedBox(height: 3),
                                        TextWhiteNum(coronaModel.sembuh),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'images/sembuh.png',
                                    width: 100,
                                    height: 150,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            color: Color(0xFFFAB657),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              // padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        TextWhiteBold('POSITIF'),
                                        SizedBox(height: 3),
                                        TextWhiteNum(coronaModel.positif),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'images/positif.png',
                                    width: 100,
                                    height: 150,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            color: Color(0xFFF66862),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              // padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        TextWhiteBold('MENINGGAL'),
                                        SizedBox(height: 3),
                                        TextWhiteNum(coronaModel.meninggal),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'images/meninggal.png',
                                    width: 100,
                                    height: 150,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(bottom: 0, right: 10),
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
                      Container(
                        // padding: EdgeInsets.only(top: 20),

                        color: Color(0xff142E57),
                        child: Stack(
                          children: [
                            // Image.asset(
                            //   'images/partikel_long.png',
                            // ),
                            ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 0.5,
                                child: Image.asset(
                                  'images/partikel_long.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 30),
                              child: Container(
                                height: 500,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'images/5m.png',
                                      width: 200,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'images/5m_1.png',
                                          width: 130,
                                        ),
                                        TextWhiteBold('Memakai Masker'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextWhiteBold('Mencuci Tangan'),
                                        Image.asset(
                                          'images/5m_2.png',
                                          width: 130,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'images/5m_3.png',
                                          width: 130,
                                        ),
                                        TextWhiteBold('Menjaga Jarak'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextWhiteBold('Membatasi Mobilitas'),
                                        Image.asset(
                                          'images/5m_4.png',
                                          width: 130,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'images/5m_5.png',
                                          width: 130,
                                          // color: Colors.red,
                                        ),
                                        TextWhiteBold('Menjauhi Kerumunan'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
          // if (widget.isCasesNull) {
          //   return Text('You are not connected');
          // }
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

