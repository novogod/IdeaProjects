import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_class/model/movie.dart';

import 'movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              movieCard(movieList[index], context),
              Positioned(
                  top: 1.6, child: movieImage(movieList[index].images[0])),
            ],
          );
          // return Card(
          //   elevation: 6,
          //   color: Colors.white,
          //   child: ListTile(
          //     title: Text("${movieList[index].title}"),
          //     subtitle: Text("click to read more ->", style: TextStyle(
          //       color: Colors.blue, fontWeight: FontWeight.bold
          //     ),),
          //     leading: CircleAvatar(
          //       child: Container(
          //         width: 200,
          //         height: 200,
          //         decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(12.9),
          //         image: DecorationImage(
          //           image: NetworkImage(movieList[index].poster),
          //           fit: BoxFit.cover,
          //         )),
          //       ),
          //     ),
          //     trailing: Text("..."),
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => MovieListViewDetails(
          //                     movieName: movieList[index].title,
          //                 movie: movieList[index],
          //                   )));
          //     },
          //   ),
          // );
        },
      ),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 20,
        height: 120,
        margin: EdgeInsets.only(left: 50),
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 54),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rating: ${movie.imdbRating} of 10",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        movie.runtime,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        movie.rated,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    )));
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(movieName),
          backgroundColor: Colors.blueGrey.shade400,
        ),
        body: ListView(
          children: [
            MovieDetailsThumbnail(
              thumbnail: movie.images[0],
            ),
            MovieDetailsHeaderWithPoster(
              movie: movie,
            ),
            HorizontalLine(),
            MovieDetailsCast(
              movie: movie,
            ),
            HorizontalLine(),
            MovieDetailsExtraPosters(posters: movie.images,)

          ],
        )
        // Center(
        //   child: Container(
        //     child: RaisedButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       child: Text("Go back to ${movie.title}"),
        //     ),
        //   ),
        // ),
        );
  }
}

