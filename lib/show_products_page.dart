import 'package:flutter/material.dart';
import 'package:flutterf/ApiProvider.dart';
import 'package:flutterf/Product_model.dart';
import 'package:flutterf/custom_main_product_card.dart';

class ShowProductsPage extends StatefulWidget {
  const ShowProductsPage({super.key});

  @override
  State<ShowProductsPage> createState() => _ShowProductsPageState();
}

class _ShowProductsPageState extends State<ShowProductsPage> {
  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "products category page",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 48,
        ),
        child: FutureBuilder(
          future: ApiProvider().getProductsCategory(categoryName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ProductsModel data = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 48,
                  childAspectRatio: 0.6,
                ),
                itemCount: data.products!.length,
                itemBuilder: (context, index) => Transform.translate(
                  offset: Offset(0, index.isOdd ? 36 : 0),
                  child: CustomMainProductCard(
                    product: data.products![index],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Container(
                height: 400,
                color: Colors.red,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
