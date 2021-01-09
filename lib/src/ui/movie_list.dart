import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/model/movie.dart';
import 'package:flutter_provider_sample/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  MovieList({Key key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieProvider _movieProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();
  }

  @override
  void dispose() {
    _movieProvider.clearMovies();
    super.dispose();
  }

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(movie.posterUrl)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    child: Text(
                      movie.overview,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                      maxLines: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: _makeMovieOne(movies[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List with Provider"),
      ),
      body: Consumer<MovieProvider>(
        builder: (BuildContext context, MovieProvider value, Widget child) {
          if (value.movies != null && value.movies.length > 0) {
            return _makeListView(value.movies);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
