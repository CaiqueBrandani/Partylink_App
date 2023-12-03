// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:partylink/globals/globals_function.dart';
// import 'package:partylink/globals/globals_store/globals_store.dart';
// import 'package:partylink/globals/globals_var.dart';
// import 'package:partylink/model/user_model.dart';
// import 'package:partylink/pages/login_screen/store/login_store.dart';
// import 'package:http/http.dart' as http;

// class LoginFunctions {
//   BuildContext context;
//   LoginFunctions(this.context);

//   Future singIn(
//     GlobalsStore globalsStore,
//     LoginStore loginStore,
//   ) async {
//     try {
//       if (!await GlobalsFunctions().verificaConexao()) {
//         globalsStore.setLoading(true);

//         if (!(await GlobalsFunctions().verificaConexao())) {
//           try {
//             var request = await http.get(
//               Uri.parse('${GlobalsVars().urlApi}/clientes?email[eq]=${loginStore.loginControllerEmail}&senha[eq]=${loginStore.loginControllerPassword}'),
//             );

//             print(request.)

//             loginStore.setUser(request.body);

//           } catch (e) {
//             log("ERRO GET CREDENCIALS >> $e");
//           }
//         } else {
//           globalsStore.setLoading(false);
//         }
//         globalsStore.setLoading(false);
//       } else {
//         // GlobalsAlert(context).alertError(
//         //   title: "Atenção!",
//         //   text:
//         //       "Não foi possivel efetuar o login, verifique sua conexão com a internet e tente novamente.",
//         //   ontap: () => Navigator.of(context).pop(),
//         // );
//       }
//     } on Exception catch (e) {
//       log("ERRO LOGIN >> $e");
//       // GlobalsAlert(context).alertError(
//       //   title: "Atenção!",
//       //   text:
//       //       "Não foi possivel efetuar o login, algo inesperado aconteceu, tente novamente mais tarde.",
//       //   ontap: () => Navigator.of(context).pop(),
//       // );
//     }
//   }
// }
