import 'package:flutter/material.dart';
import 'package:info_covid/model/corona_model.dart';
import 'package:info_covid/style/my_text.dart';

class ProvinsiWebPage extends StatefulWidget {
  final Future cases;

  ProvinsiWebPage({Key? key, required this.cases}) : super(key: key);

  @override
  _ProvinsiWebPageState createState() => _ProvinsiWebPageState();
}

class _ProvinsiWebPageState extends State<ProvinsiWebPage> {
  var cases;

  @override
  void initState() {
    super.initState();
    cases = widget.cases;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: cases,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var provinsi = snapshot.data!.covid;
            return GridView.builder(
                itemCount: provinsi.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 2,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailProvinsiWebPage(provinsi[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff142E57),
                      child: Center(
                        child: Text(
                          provinsi[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DetailProvinsiWebPage extends StatelessWidget {
  final CoronaModel provinsi;

  DetailProvinsiWebPage(this.provinsi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              // Image.network(
              //   'https://images.pexels.com/photos/2450221/pexels-photo-2450221.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              // ),
              // Image.asset(
              //   'images/city.jpg',
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.topCenter,
                  image: AssetImage('images/city.jpg'),
                )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    TextWhiteNum(provinsi.name),
                  ],
                ),
              ),
            ],
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
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                        TextWhiteNumSmall(provinsi.sembuh),
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
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                        TextWhiteNumSmall(provinsi.positif),
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
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                        TextWhiteNumSmall(provinsi.meninggal),
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
        ],
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     child: Text('Back ${provinsi.name}'),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
    );
  }
}
