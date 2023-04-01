// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moviefactory/buscar.dart';
import 'package:moviefactory/favoritos.dart';
import 'package:moviefactory/perfil.dart';
import 'package:moviefactory/Models/peliculas.dart';
import 'package:moviefactory/wigets/peliculaPage.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Pelicula> imagesList = allMovies;

  int tabSelected = 1;
  int selectedIndex = 0;

  void onItemTapped(int index){
    setState((() {
        selectedIndex = index;
    }));
  }

  @override
  Widget build(BuildContext context) {
    var screens = [homeScreen(), Buscar(), Favoritos(), Perfil()];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          bottomNavigationBar: BottomNavigationBar( 
            selectedItemColor: Colors.yellow,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:"Home",
                backgroundColor: Colors.black.withOpacity(0.3),
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label:"Buscar",
                 backgroundColor: Colors.black.withOpacity(0.3),
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
              label:"Favoritos",
               backgroundColor: Colors.black.withOpacity(0.3),
              
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label:"Perfil",
                 backgroundColor: Colors.black.withOpacity(0.3),
                ),
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
          ),
          body: screens[selectedIndex],
         
        ));
  }

  Column homeScreen() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Header(),
            title(),
            Tabs(),
            MoviesCarousel(),
          ],
        );
  }

  // ignore: non_constant_identifier_names
  CarouselSlider MoviesCarousel() {
    return CarouselSlider(
        items: imagesList
            .map((item) => Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Builder(
                      builder: (context) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context)=> peliculaPage(pelicula: item,)));
                          },
                          child: Image.asset(
                            item.urlImage,
                            width: 200,
                            fit: BoxFit.contain,
                          ),
                        );
                      }
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: false, aspectRatio: 1.0, enlargeCenterPage: true));
  }

  // ignore: non_constant_identifier_names
  Padding Tabs() {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 14),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    tabSelected = 1;
                  });
                },
                child: Text("Popular",
                    style: TextStyle(
                        color: tabSelected == 1
                            ? Colors.yellowAccent
                            : Colors.white,
                        fontFamily: 'Monstserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tabSelected = 2;
                  });
                },
                child: Text("Nuevo",
                    style: TextStyle(
                        color: tabSelected == 2
                            ? Colors.yellowAccent
                            : Colors.white,
                        fontFamily: 'Monstserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tabSelected = 3;
                  });
                },
                child: Text("Premier",
                    style: TextStyle(
                        color: tabSelected == 3
                            ? Colors.yellowAccent
                            : Colors.white,
                        fontFamily: 'Monstserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tabSelected = 4;
                  });
                },
                child: Text("Random",
                    style: TextStyle(
                        color: tabSelected == 4
                            ? Colors.yellowAccent
                            : Colors.white,
                        fontFamily: 'Monstserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
              )
            ]));
  }

  Padding title() {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text("Peliculas",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 30)));
  }

  // ignore: non_constant_identifier_names
  Padding Header() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, size: 25, color: Colors.white)),
            Text(
              "MovieFactory",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Monstserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/foto_perfil.jpeg'),
                ))
          ],
        ));
  }
}
