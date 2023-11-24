import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:partylink/globals/globals_function.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../globals/globals_store/globals_store.dart';
import 'store/event_store.dart';

class EventFunctions {
  BuildContext context;
  EventFunctions(this.context);

  Future getEvent() async {
    final eventStore = Provider.of<EventStore>(context, listen: false);
    final globalsStore = Provider.of<GlobalsStore>(context, listen: false);

    globalsStore.setLoading(true);

    if (!(await GlobalsFunctions().verificaConexao())) {
      try {
        var request = await http.get(
          Uri.parse('${GlobalsVars().urlApi}/eventos?cliente_id[eq]=2'),
        );

        eventStore.addEventList(request.body);

      } catch (e) {
        log("ERRO GET EVENT >> $e");
      }
    } else {
      globalsStore.setLoading(false);
    }
    globalsStore.setLoading(false);
  }

  Future eventFunctionsPrincipal() async {}
}