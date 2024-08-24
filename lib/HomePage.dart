import 'package:flutter/material.dart';
import 'package:flutterf/AboutUs.dart';
import 'package:flutterf/ApiProvider.dart';
import 'package:flutterf/Product_model.dart';

import 'package:flutterf/categorey.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Category1> names = const [
    Category1(
      name: "fouad",
      message: "this is my name",
      price: 90,
      image: 'hfiohfdaih',
    ),
    Category1(
      name: "samy",
      message: "this is my name",
      price: 70,
      image: 'bjvbjbv',
    ),
    Category1(
      name: "ramadan",
      message: "this is my name",
      price: 50,
      image: 'gfdiu',
    ),
    Category1(
      name: "ebrahiem",
      message: "this is my name",
      price: 30,
      image: 'fgu',
    ),
    Category1(
        name: "elozery", message: "this is my name", price: 20, image: 'yuufj'),
  ];
  ProductsModel? productlist;
  bool isloading = true;
  getproductfromapi() async {
    productlist = await ApiProvider().getProducts();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getproductfromapi();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HOME",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: isloading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => Category1(
                      name: productlist!.products![index].title!,
                      message: productlist!.products![index].category!.name,
                      image: productlist!.products![index].thumbnail!,
                      price: productlist!.products![index].price!,
                    ),
                separatorBuilder: (BuildContext context, index) =>
                    const SizedBox(
                      height: 20,
                    ),
                itemCount: productlist!.products!.length),
      ),
    );
  }
}
