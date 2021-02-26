import 'package:crud_firebase/src/blocs/productos_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:crud_firebase/src/blocs/login_bloc.dart';
export 'package:crud_firebase/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget{
  
  final loginBloc = LoginBloc();
  final _productosBloc = ProductosBloc();

  // patron bloc con patron singleton
    static Provider _instacia;

    factory Provider({Key key, Widget child}) {
      if (_instacia == null) {
        _instacia = new Provider._internal(key: key, child: child);
      }
      return _instacia;
    }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static ProductosBloc productosBloc ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>()._productosBloc;
  }

}