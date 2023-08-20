import 'package:core/utils/constants.dart';
import 'package:core/presentation/pages/movies_page.dart';
import 'package:core/presentation/pages/tv_shows_page.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _type = movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              accountName: Text('Abdan Zaki Alifian'),
              accountEmail: Text('abdanzakialifian99@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                setState(() {
                  _type = movies;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('Tv Shows'),
              onTap: () {
                setState(() {
                  _type = tvShows;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, watchlistPageRoute);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, aboutPageRoute);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_type == movies ? "Movies" : "Tv Shows"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                searchPageRoute,
                arguments: _type,
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _type == movies
          ? MoviesPage(
              type: _type,
            )
          : TvShowsPage(
              type: _type,
            ),
    );
  }
}
