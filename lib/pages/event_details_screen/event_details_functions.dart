import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:partylink/globals/globals_var.dart';

class EventDetailsFunctions {
  BuildContext context;
  EventDetailsFunctions(this.context);

  Future<bool> deleteEvent(int eventId) async {
    try {
      final response = await http
          .delete(Uri.parse('${GlobalsVars().urlApi}/eventos/$eventId'));

      if (response.statusCode == 200) {
        print('Evento excluído com sucesso!');
        return true;
      } else {
        print(
            'Falha ao excluir o evento. Código de status: ${response.statusCode}');
        print(response.body);
        return false;
      }
    } catch (e) {
      print('Erro ao fazer a solicitação DELETE: $e');
    }
    return false;
  }
}
