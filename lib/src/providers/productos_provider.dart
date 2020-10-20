import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/models/producto_model.dart';

class ProductosProvider{
  final String _url = 'https://flutter-app-16387.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto)async{
    final url = '$_url/productos.json';
    final response = await http.post(url,body: productoModelToJson(producto));
    final decodedData = json.decode(response.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos()async{

  }
}