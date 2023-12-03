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

  String desconvertData(String data) {
    List<String> partes = data.split('-');

    String dataDesconvertida = "${partes[2]}/${partes[1]}/${partes[0]}";

    return dataDesconvertida;
  }
}
