import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:partylink/globals/globals_function.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/pages/home_screen/store/home_store.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeFunctions {
  BuildContext context;
  HomeFunctions(this.context);

  Future getCategory() async {
    final homeStore = Provider.of<HomeStore>(context);

    homeStore.setLoading(true);

    if (!(await GlobalsFunctions().verificaConexao())) {
      try {
        var request = await http.get(
          Uri.parse('${GlobalsVars().urlApi}/categorias'),
        );

        homeStore.addCategoryList(request.body);

      } catch (e) {
        log("ERRO GET ORDEM >> $e");
      }
    } else {
      homeStore.setLoading(false);
    }
    homeStore.setLoading(false);
  }

  Future getProduct() async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);

    homeStore.setLoading(true);

    if (!(await GlobalsFunctions().verificaConexao())) {
      try {
        var request = await http.get(
          Uri.parse('${GlobalsVars().urlApi}/produtos'),
        );

        homeStore.addProductList(request.body);
        
      } catch (e) {
        log("ERRO GET ORDEM >> $e");
      }
    } else {
      homeStore.setLoading(false);
    }
    homeStore.setLoading(false);
  }

  Future homeFunctionsPrincipal() async {}

  // void openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
  //   scaffoldKey.currentState?.openDrawer();
  // }
}
