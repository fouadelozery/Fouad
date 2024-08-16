import 'package:dio/dio.dart';
import 'package:flutterf/ProductsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  ProductsModel? productsList;
// final String baseUrl = "https://dummyjson.com";

  Future<ProductsModel?> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      Response response = await Dio().get('https://dummyjson.com/products',
          queryParameters: {"select": "id,title,description,price,thumbnail"},
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
