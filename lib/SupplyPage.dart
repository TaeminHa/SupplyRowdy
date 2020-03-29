import 'package:flutter/material.dart';
import 'Info.dart';

class SupplyPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SupplyPage> {

  TextEditingController dairyController;
  TextEditingController familyController;
  TextEditingController grainController;
  TextEditingController fruitController;
  TextEditingController vegetableController;
  TextEditingController meatController;
  TextEditingController fatController;




  int fruitTotal;
  int familyTotal;
  int vegetableTotal;
  int grainTotal;
  int meatTotal;
  int fatTotal;
  int dairyTotal;
  //servings per day
  int spdFruit = 4;
  int spdVegetable = 3;
  int spdGrain = 6;
  int spdMeat = 3;
  int spdFat = 2;
  int spdDairy = 2;

  double daysFat;
  double daysFruit;
  double daysGrains;
  double daysMeat;
  double daysVegetable;
  double daysDairy;




  @override
  void initState() {

    super.initState();
    vegetableController = new TextEditingController();
    meatController = new TextEditingController();
    fatController = new TextEditingController();
    fruitController = new TextEditingController();
    grainController = new TextEditingController();
    dairyController = new TextEditingController();
    familyController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Supply Page",
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        Container(
            height: 450,
            color: Colors.lightBlueAccent[100],
            child: Row(children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(children: <Widget>[
                    TextField(
                      controller: familyController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 24
                          ),
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total Family Members"),
                      onChanged: (text) {
                        print("First text field: $text");

                        setState(() {
                          familyTotal = int.parse(text);

                        });
                        print("There are $familyTotal people in the family");
                      },
                    ),
                    TextField(
                      controller: fruitController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 22
                          ),
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total fruit servings"),
                      onChanged: (text) {
                        setState(() {
                          fruitTotal = int.parse(text);
                          daysFruit = (fruitTotal)/(spdFruit*familyTotal);
                          daysFruit = num.parse(daysFruit.toStringAsFixed(1));
                        });
                      },
                    ),
                    TextField(
                      controller: vegetableController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 22
                          ),
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total vegetable servings"),
                      onChanged: (text) {
                        setState(() {
                          vegetableTotal = int.parse(text);
                          daysVegetable = (vegetableTotal)/(spdVegetable*familyTotal);
                          daysVegetable = num.parse(daysVegetable.toStringAsFixed(1));
                        });
                      },
                    ),
                    TextField(
                      controller: grainController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 22
                          ),
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total grain servings"),
                      onChanged: (text) {
                        setState(() {
                          grainTotal = int.parse(text);
                          daysGrains = (grainTotal)/(spdGrain*familyTotal);
                          daysGrains = num.parse(daysGrains.toStringAsFixed(1));
                        });
                      },
                    ),
                    TextField(
                      controller: dairyController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: 22
                        ),
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total dairy product servings"),
                      onChanged: (text) {
                        setState(() {
                          dairyTotal = int.parse(text);
                          daysDairy = (dairyTotal)/(spdDairy*familyTotal);
                          daysDairy = num.parse(daysDairy.toStringAsFixed(1));
                        });
                      },
                    ),
                    TextField(
                      controller: meatController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 22
                          ),
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total meats/poultry servings"),
                      onChanged: (text) {
                        setState(() {
                          meatTotal = int.parse(text);
                          daysMeat = (meatTotal)/(spdMeat*familyTotal);
                          daysMeat = num.parse(daysMeat.toStringAsFixed(1));
                        });
                      },
                    ),
                    TextField(
                      controller: fatController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 22
                          ),
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total fats/oils servings"),
                      onChanged: (text) {
                        setState(() {
                          fatTotal = int.parse(text);
                          daysFat = (fatTotal)/(spdFat*familyTotal);
                          daysFat = num.parse(daysFat.toStringAsFixed(1));
                        });
                      },
                    ),


                  ]))
            ])),

        //Recommended part

        Container(

            color: Colors.greenAccent[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 5),

                Text(
                  'According to the 1600 calorie a day diet by Mayo Clinic, a family of $familyTotal with this many servings will run out in this many days: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
                Text('$daysMeat of meats/poulty || $daysVegetable of vegetables',
                  style: TextStyle(
                    fontSize: 22
                  ),

                ),
                Text('$daysFat of fat || $daysFruit of fruit',
                  style: TextStyle(
                      fontSize: 22
                  ),

                ),
                Text('$daysDairy of dairy || $daysGrains of grain',
                  style: TextStyle(
                      fontSize: 22
                  ),

                ),
                SizedBox(height: 10)

              ],
            )
        ),
        Row(
        children: <Widget>[
          Expanded(
            child: FlatButton.icon(
              label: Text(
                'Home'
              ),
              icon: Icon(
                Icons.arrow_left
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.info
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info()));
              },

            )
          ),
          Expanded(
            child: FlatButton.icon(
              label: Text(
                'Map'
              ),
              icon: Icon(
                Icons.arrow_right
              ),
              onPressed: () {},
            ),
          )

        ],



        )]),
    );
  }
}