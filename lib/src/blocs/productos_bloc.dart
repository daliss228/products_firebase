

import 'dart:io';

import 'package:crud_firebase/src/models/producto_model.dart';
import 'package:crud_firebase/src/providers/producto_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductosBloc {

  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _productoProvider = new ProductosProvider();

  Stream<List<ProductoModel>> get productsStream => _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarProducto() async {
    final productos = await _productoProvider.cargarProducto();
    _productosController.sink.add(productos);
  }

  void crearProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    await _productoProvider.crearProducto(producto);
    _cargandoController.sink.add(false);
  }

  void editarProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    await _productoProvider.editarProducto(producto);
    _cargandoController.sink.add(false);
  }

  void borrarProducto(String id) async {
    _cargandoController.sink.add(true);
    await _productoProvider.borrarProducto(id);
    _cargandoController.sink.add(false);
  }

  Future<String> subirImagen(File photo) async {
    _cargandoController.sink.add(true);
    final foto = await _productoProvider.subirImagen(photo);
    _cargandoController.sink.add(false);
    return foto;
  }



  dispose(){
    _productosController?.close();
    _cargandoController?.close();
  }

}