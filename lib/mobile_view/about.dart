import 'package:flutter/material.dart';
import 'package:info_covid/style/my_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff142E57),
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.50,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Color(0xff142E57),
                  height: 150,
                  width: 210,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "images/profile.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextWhiteBold("Asyraf Shafiyyurrahman"),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            // color: Colors.green,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextWhiteBold("CONTACT"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/github.png',
                      width: 25,
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: TextWhiteDesc("asyraf07"),
                      onTap: () => launch("https://github.com/asyraf07"),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/instagram.png',
                      width: 25,
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: TextWhiteDesc("@kingfast07"),
                      onTap: () => launch("https://instagram.com/kingfast07"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/linkedin.png',
                      width: 25,
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: TextWhiteDesc(
                        "Asyraf Shafiyyurrahman",
                      ),
                      onTap: () => launch(
                          "https://www.linkedin.com/in/asyraf-shafiyyurrahman-29a7761b1/"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
