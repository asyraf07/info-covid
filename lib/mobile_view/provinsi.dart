import 'package:flutter/material.dart';
import 'package:info_covid/model/corona_model.dart';
import 'package:info_covid/style/my_text.dart';

class ProvinsiMobilePage extends StatefulWidget {
  final Future cases;

  ProvinsiMobilePage({Key? key, required this.cases}) : super(key: key);

  @override
  _ProvinsiMobilePageState createState() => _ProvinsiMobilePageState();
}

class _ProvinsiMobilePageState extends State<ProvinsiMobilePage> {
  var yow;

  @override
  void initState() {
    super.initState();
    yow = widget.cases;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: yow,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var provinsi = snapshot.data!.covid;
            return ListView.builder(
                itemCount: provinsi.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailProvinsiMobilePage(provinsi[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff142E57),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Stack(children: [
                            Container(
                              height: 70,
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                'images/partikel.png',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextWhiteBold(
                                    '${index + 1}',
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextWhiteBold(
                                    provinsi[index].name,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            // if (widget.isCasesNull) {
            //   return Text('You are not connected');
            // }
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DetailProvinsiMobilePage extends StatelessWidget {
  final CoronaModel provinsi;

  DetailProvinsiMobilePage(this.provinsi);

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
              Image.asset(
                'images/city.jpg',
              ),
              Container(
                height: 275,
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
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'Informasi Covid-19 terkini di ${provinsi.name}',
                          textAlign: TextAlign.center,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWhiteBold('SEMBUH'),
                                    SizedBox(height: 3),
                                    TextWhiteNum(provinsi.sembuh),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWhiteBold('POSITIF'),
                                    SizedBox(height: 3),
                                    TextWhiteNum(provinsi.positif),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWhiteBold('MENINGGAL'),
                                    SizedBox(height: 3),
                                    TextWhiteNum(provinsi.meninggal),
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
                      SizedBox(height: 20),
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