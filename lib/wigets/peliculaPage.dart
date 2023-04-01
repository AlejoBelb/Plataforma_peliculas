// ignore_for_file: sized_box_for_whitespace, unused_field, unnecessary_new, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:moviefactory/Models/peliculas.dart';
import 'package:moviefactory/Video/video.dart';

class peliculaPage extends StatefulWidget {
  final Pelicula pelicula;
  const peliculaPage({super.key, required this.pelicula});

  @override
  State<peliculaPage> createState() => _peliculaPageState();
}

class _peliculaPageState extends State<peliculaPage> {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Imagen
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Center(
                    child: Image.asset(
                      widget.pelicula.urlImage,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              //Título
              Center(
                child: Text(
                  widget.pelicula.title,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),

              //Sinopsis
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Sinopsis",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),

              //Texto de sinopsis
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                child: Text(
                  widget.pelicula.sinopsis,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),


              const SizedBox(height: 50,),

              //Botónes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Regresar",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow
                      ),
                      onPressed: () {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context)=> Video(urlVideo:widget.pelicula.urlVideo)));
                      },
                      child: const Text(
                        "Ver película",
                        style: TextStyle(color: Colors.black, fontSize: 18),),
                    ),
                  ),
                ],
              )
            ]),
          ),
        );
  }
}
