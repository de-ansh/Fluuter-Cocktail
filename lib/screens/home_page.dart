import 'dart:convert';

import 'package:cocktail/screens/drinkdetail.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(api));

    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.brown, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Cocktail App"),
          elevation: 0.0,
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(drink[
                                    "strDrinkThumb"] ??
                                "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg"),
                          ),
                        ),
                        title: Text(
                          "${drink["strDrink"]} ",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]} ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(drink: drink),
                              ));
                        },
                      );
                    },
                  )
                : CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
      ),
    );
  }
}
