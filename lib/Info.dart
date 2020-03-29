import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 20),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "According to the 1600 calorie per day per person meal plan by Mayo Clinic, the following serving recomendations are: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(height: 10),
                    Card(
                      color: Colors.red[300],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('Fruit'),
                            subtitle: Text(
                                '4 Servings a day',
                              style: TextStyle(
                                color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.greenAccent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('Vegetable'),
                            subtitle: Text('3 Servings a day',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.amberAccent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('Grain'),
                            subtitle: Text('6 Servings a day',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.grey[100],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('Dairy'),
                            subtitle: Text('2 Servings a day',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.brown[300],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('Meat/Poulty'),
                            subtitle: Text('3 Servings a day',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.orange,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('Fat/Oil'),
                            subtitle: Text('2 Servings a day',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        "return"
                      ),

                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
