import 'package:cocktail/main.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final drink;
  const DetailPage({Key? key, @required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(drink["strDrink"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "ID: ${drink["idDrink"]} ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "${drink["strDrink"]} ",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
