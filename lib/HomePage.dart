import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
            height: 435,
            color: Colors.lightBlueAccent[100],
            child: Row(children: <Widget>[
              SizedBox(
                width: 10,
                height: 10,
              ),
              Expanded(
                  child: Column(children: <Widget>[
                    TextField(
                      controller: familyController,
                      decoration: InputDecoration(
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
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total fruit servings"),
                      onChanged: (text) {
                        setState(() {
                          fruitTotal = int.parse(text);
                          daysFruit = (fruitTotal)/(spdFruit*familyTotal);
                        });
                      },
                    ),
                    TextField(
                      controller: vegetableController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total vegetable servings"),
                      onChanged: (text) {
                        setState(() {
                          vegetableTotal = int.parse(text);
                          daysVegetable = (vegetableTotal)/(spdVegetable*familyTotal);
                        });
                      },
                    ),
                    TextField(
                      controller: grainController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total grain servings"),
                      onChanged: (text) {
                        setState(() {
                          grainTotal = int.parse(text);
                          daysGrains = (grainTotal)/(spdGrain*familyTotal);
                        });
                      },
                    ),
                    TextField(
                      controller: dairyController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total dairy product servings"),
                      onChanged: (text) {
                        setState(() {
                          dairyTotal = int.parse(text);
                          daysDairy = (dairyTotal)/(spdDairy*familyTotal);
                          print(dairyTotal);
                        });
                      },
                    ),
                    TextField(
                      controller: meatController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total meats/poultry servings"),
                      onChanged: (text) {
                        setState(() {
                          meatTotal = int.parse(text);
                          daysMeat = (meatTotal)/(spdMeat*familyTotal);
                        });
                      },
                    ),
                    TextField(
                      controller: fatController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '(1..2..3..)',
                          labelText: "Total fats/oils servings"),
                      onChanged: (text) {
                        setState(() {
                          fatTotal = int.parse(text);
                          daysFat = (fatTotal)/(spdFat*familyTotal);
                        });
                      },
                    ),


                  ]))
            ])),

        //Recommended part

        Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  'According to the 1600 calorie a day diet by Mayo Clinic, a family of $familyTotal with this many servings will run out in this many days: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text('$daysFruit of fruit'),
                Text('$daysVegetable of vegetables'),
                Text('$daysGrains of of grain'),
                Text('$daysDairy of dairy'),
                Text('$daysMeat of meats/poultry'),
                Text('$daysFat of fat')




              ],
            )
        )]),
    );
  }
}