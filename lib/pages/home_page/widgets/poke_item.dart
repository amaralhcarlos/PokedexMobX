import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_mobx/consts/consts_api.dart';
import 'package:pokedex_mobx/consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  final String nome;
  final int index;
  final Color color;
  final String num;
  final List<String> types;

  const PokeItem(
      {Key key, this.nome, this.index, this.color, this.num, this.types})
      : super(key: key);

  Widget setTipos() {
    List<Widget> lista = [];
    this.types.forEach((type) {
      lista.add(Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(80, 255, 255, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                type.trim(),
                style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ));
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      ConstsApp.whitePokeball,
                      height: 115,
                      width: 115,
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CachedNetworkImage(
                  height: 95,
                  width: 95,
                  placeholder: (context, url) =>
                      new Container(color: Colors.transparent),
                  imageUrl:
                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png',
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    nome,
                    style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 40.0),
                child: setTipos(),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: ConstsApi.getColorByType(type: types[0]),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
