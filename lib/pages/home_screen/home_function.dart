import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:partylink/globals/globals_function.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/pages/home_screen/store/home_store.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../globals/globals_store/globals_store.dart';

class HomeFunctions {
  BuildContext context;
  HomeFunctions(this.context);

  Future getCategory() async {
    final homeStore = Provider.of<HomeStore>(context);
    final globalsStore = Provider.of<GlobalsStore>(context);

    globalsStore.setLoading(true);

    if (!(await GlobalsFunctions().verificaConexao())) {
      try {
        var request = await http.get(
          Uri.parse('${GlobalsVars().urlApi}/categorias'),
        );

        homeStore.addCategoryList(request.body);

      } catch (e) {
        log("ERRO GET CATEGORY >> $e");
      }
    } else {
      globalsStore.setLoading(false);
    }
    globalsStore.setLoading(false);
  }

  Future getProduct() async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    final globalsStore = Provider.of<GlobalsStore>(context, listen: false);

    globalsStore.setLoading(true);

    if (!(await GlobalsFunctions().verificaConexao())) {
      try {
        var request = await http.get(
          Uri.parse('${GlobalsVars().urlApi}/produtos'),
        );

        homeStore.addProductList(request.body);
        
      } catch (e) {
        log("ERRO GET PRODUCT >> $e");
      }
    } else {
      globalsStore.setLoading(false);
    }
    globalsStore.setLoading(false);
  }

  Future getMeasure() async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    final globalsStore = Provider.of<GlobalsStore>(context, listen: false);

    globalsStore.setLoading(true);

    if (!(await GlobalsFunctions().verificaConexao())) {
      try {
        var request = await http.get(
          Uri.parse('${GlobalsVars().urlApi}/medidas'),
        );

        homeStore.addMeasureList(request.body);
        
      } catch (e) {
        log("ERRO GET MEASURE >> $e");
      }
    } else {
      globalsStore.setLoading(false);
    }
    globalsStore.setLoading(false);
  }

  Future homeFunctionsPrincipal() async {}
}
