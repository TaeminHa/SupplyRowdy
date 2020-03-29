import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:validators/sanitizers.dart';

class GMaps extends StatefulWidget {
  @override
  _GMapsState createState() => _GMapsState();
}

class _GMapsState extends State<GMaps> {

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  @override

  void initState() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/pin.png').then((onValue) {
      pinLocationIcon = onValue;
    });
  }

  static const lat = 29.745922;
  static const lon = -95.780110;
  static const apiKey = 'AIzaSyCSvT36gaI2cE3wX8fR6Zcv9NZUBsF9LIY';
  String shop;
  List<Marker> markers = <Marker>[];

  Future<List<String>> searchNearBy(String keyword) async {
    var dio = Dio();
    var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    var parameters = {
      'key': apiKey,
      'location': '$lat,$lon',
      'radius': '2000',
      'keyword': keyword,
    };

    var response = await dio.get(url, data: parameters);
    return response.data['results'].map<String>((result) => result['name'].toString()).toList();
  }

  Future<List<String>> searchNearByCoordinates(String keyword, String c) async {
    var dio = Dio();
    var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    var parameters = {
      'key': apiKey,
      'location': '$lat,$lon',
      'radius': '2000',
      'keyword': keyword,
    };

    var response = await dio.get(url, data: parameters);
    return response.data['results'].map<String>((result) => result['geometry']['location'][c].toString()).toList();
  }

  var list;
  Future<Null> refreshApp() async {
    GlobalKey<RefreshIndicatorState>().currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0));

    setState(() {
      list = List.generate(Random().nextInt(10), (i) => "Item $i");
    });

    return null;
  }

  Position _currentPosition = Position(latitude:29.745922 ,longitude:-95.780110);
  
  GoogleMapController mapController;

    _getCurrentLocation() {
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager;

      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
    }

    TextEditingController textEditingController = new TextEditingController();

    ShopInfo(String _t) {
      return Container(
        child: ListView(
          children: <Widget>[
            Text(_t, style: TextStyle(fontSize: 100),),
            TextField(
              controller: textEditingController,
            ),
          ],
        ),
      );
    }

    var id = ['Sprouts Farmers Market', 'Harvest Market Katy', 'Trader Joe\'s', 'Whole Foods Market', 'Walmart Neighborhood Market', 'Promise Land African Caribbean Grocery Store', '99 Ranch Market', 'H-E-B', 'Fiesta Mart, LLC', 'Katy Russian Corner', 'Alnoor Market Grocers', 'Kroger', 'Dube\'s Super Market', 'H-E-B', 'H-E-B', 'Souq International Markets Katy', 'Keemat Grocers Katy, TX', 'Walmart Neighborhood Market', 'Kroger Marketplace', 'H Mart'];
    var latt = [29.743338, 29.7504798, 29.7403352, 29.712764, 29.7443742, 29.7768217, 29.7758008, 29.7197215, 29.780591, 29.7810355, 29.7005949, 29.7874713, 29.789239, 29.7739099, 29.7597392, 29.7480326, 29.7587117, 29.7632189, 29.7927453, 29.7581247];
    var lngg = [-95.769342, -95.797907, -95.7748374, -95.77168089999999, -95.79231539999999, -95.77887799999999, -95.7501194, -95.8483995, -95.80077899999999, -95.7491137, -95.8115421, -95.8220407, -95.7170471, -95.8218638, -95.75020719999999, -95.7507864, -95.7316276, -95.8439584, -95.7743697, -95.77840929999999];

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
            body: Stack(
              children: <Widget>[
                GoogleMap(
                    markers: _markers,
                    onMapCreated: (GoogleMapController controller) {

                      mapController = controller;
                      _controller.complete(controller);
                      refreshApp();
                      setState(() {
                        for(int i=0;i<id.length;i++){
                          _markers.add(
                              Marker(
                                markerId: MarkerId(i.toString()),
                                position: LatLng(latt[i],lngg[i]),
                                icon: pinLocationIcon,
                                onTap: () {
                                  return ShopInfo(id[i]);
                                }
                              )
                          );
                        }
                        refreshApp();
                      });
                    },
                    initialCameraPosition: CameraPosition(target:
                    LatLng(
                        _currentPosition.latitude, _currentPosition.longitude),
                        zoom: 12)
                ),
                    if (_currentPosition != null)
                      Container(
                        child: FloatingActionButton(
                          child: Icon(Icons.my_location),
                          onPressed: () {
                            _getCurrentLocation();
                            mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: LatLng(_currentPosition.latitude,
                                        _currentPosition.longitude), zoom: 12),
                              ),
                            );
                          },
                        ),
                        alignment: Alignment.bottomRight,
                      ),
              ],
            )
        ),
      );
    }
  }
