import 'package:flutter/material.dart';

class ConnectionFail extends StatelessWidget {
  const ConnectionFail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        height: 150,
        padding: const EdgeInsets.all(10),
        child: const Text(
          "Desculpe, ocorreu um erro de conexão com a API. Por favor, verifique sua conexão com a internet e tente novamente mais tarde. Se o problema persistir, entre em contato com nossa equipe de suporte para obter assistência. Lamentamos qualquer inconveniente causado.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
