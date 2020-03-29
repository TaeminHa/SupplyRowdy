import 'package:flutter/material.dart';
import 'SupplyPage.dart';




class Home extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/CitiesLights.PNG"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  color: Colors.black,
                  child: Text(
                    "Lets get Started",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (SupplyPage())));
                  },
                )
              ],

            )
          ],
        )
      ),
    );
  }
}
