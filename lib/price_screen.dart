import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropdownButton<String> getByAndroid() {
    String theSelectedFirst = "CFA";
    List<DropdownMenuItem<String>> allTheCurrencies = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String theSelected = currenciesList[i];
      var theMenu = DropdownMenuItem(
        child: Text(theSelected),
        value: theSelected,
      );
      allTheCurrencies.add(theMenu);
    }
    DropdownButton<String> dr = DropdownButton<String>(
      value: theSelectedFirst,
      items: allTheCurrencies,
      onChanged: (value) {
        setState(() {
          theSelectedFirst = value;
        });
      },
    );
    return dr;
  }

  CupertinoPicker getByIos() {
    List<Text> allTheCurrencies = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String theSelected = currenciesList[i];
      var theMenu = Text(theSelected);
      allTheCurrencies.add(theMenu);
    }
    CupertinoPicker cu = CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: allTheCurrencies);
    return cu;
  }

  NetworkHelper n0 = new NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isAndroid ? getByAndroid() : getByIos()),
        ],
      ),
    );
  }
}
