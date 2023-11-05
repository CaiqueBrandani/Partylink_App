import 'package:connectivity_plus/connectivity_plus.dart';

class GlobalsFunctions {

  Future<bool> verificaConexao() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }
}