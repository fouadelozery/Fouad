import 'package:dio/dio.dart';
import 'package:flutterf/Product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  ProductsModel? productsList;
  ProductsModel? categoryList;
// final String baseUrl = "https://dummyjson.com";

  Future<ProductsModel?> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      Response response = await Dio().get('https://dummyjson.com/products',
          queryParameters: {
            "select": "id,title,description,category,price,thumbnail,"
          },
          options: Options(headers: {
            "Authorization": "Bearer ${prefs.getString("userToken")}"
          }));

      productsList = ProductsModel.fromJson(response.data);
      print("*****");
      print(productsList?.products?[1].title);
      print("*");
      return productsList;
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
      print(e.toString());
    }
    return null;
  }

  Future<List<String>> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products?select=category'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['name'].toString()).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<String>> fetchProducts(String category) async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/products?select=category=$category'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['name'].toString()).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  userLogin({required String userName, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData userData =
        FormData.fromMap({"username": userName, "password": password});

    try {
      Response response =
          await Dio().post('https://dummyjson.com/auth/login', data: userData);
      print(response.data);
      await prefs.setString('userToken', response.data['token']);
      String? userToken = prefs.getString("userToken");
      print("userToken=> $userToken");
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
    }
  }
}
