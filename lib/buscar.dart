// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moviefactory/Models/peliculas.dart';
import 'package:moviefactory/wigets/peliculaPage.dart';

class Buscar extends StatefulWidget {
  const Buscar({super.key});

  @override
  State<Buscar> createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {

  //final Set<Pelicula> _saved = new Set<Pelicula>();
  List<Pelicula> peliculas = allMovies;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        //Title
        Padding(
          padding: EdgeInsets.only(left: 15, top: 20),
          child: Center(
              child: Text(
            "Buscar",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          )),
        ),
        //Input
        Container(
          margin: EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            onChanged: (value) => searchMovie(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                hintText: "Título de la película",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),

        //Lista de películas
        Expanded(
            child: ListView.builder(
                itemCount: peliculas.length,
                itemBuilder: (context, index) {
                  var pelicula = peliculas[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context)=> peliculaPage(pelicula: pelicula,))),

                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 100,
                          minHeight: 100,
                        ),
                        child: Image.asset(
                          pelicula.urlImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        pelicula.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                })),
      ],
    );
  }

  void searchMovie(String query) {
    setState(() {
      peliculas = allMovies
          .where((pelicula) => pelicula.title.toLowerCase().contains(query))
          .toList();
    });
  }
}
/*
Widget buildRow(BuildContext context) {
    // 2da línea de código para favoritos (Verificar si se agregó a favoritos)
    //final bool alreadySaved = _save.contains(pair);
    final alreadySaved = _saved.contains(context);
    // ignore: unnecessary_new
    return new ListTile(
      //3ra Las siguientes 3 líneas son la condición de si está marcado el like)
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      //4ta este onTap es para poder interactuar y usar la condición
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(context);
          } else {
            _saved.add(context);
          }
        });
      },
    );
  }
*/