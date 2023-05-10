import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/bloc/flip_cubit/flip_cubit.dart';
import 'package:flutter_cinema/components/delayed_slide_transition.dart';
import 'package:flutter_cinema/components/movie_list_tile.dart';
import 'package:flutter_cinema/components/user_page_button.dart';
import 'package:flutter_cinema/pages/session_page.dart';
import 'package:flutter_cinema/repositories/movie_session_repository.dart';
import 'package:intl/intl.dart';

import '../bloc/movie_session_bloc/movie_session_bloc.dart';
import '../bloc/movies_bloc/movies_bloc.dart';
import '../components/cinema_tab_bar.dart';
import '../components/square_tab.dart';
import '../components/tickets_page_button.dart';
import '../models/movie.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinema'),
        actions: const [
          UserPageButton(),
          TicketsPageButton(),
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (state is MoviesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MoviesLoadedState) {
          return DefaultTabController(
            length: state.movies.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DelayedSlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: const Offset(0.0, 0.0),
                  ),
                  
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  child: CinemaTabBar(
                    tabs: [
                      for (DateTime date in state.movies.keys)
                        SquareTab(
                          child: Column(
                            children: [
                              Text(
                                DateFormat('dd.MM').format(date),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                DateFormat('E').format(date),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (MapEntry<DateTime, List<Movie>> movieEntry
                          in state.movies.entries)
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: movieEntry.value.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => MovieSessionBloc(
                                    repository: MovieSessionRepositoryImpl(),
                                  )..add(
                                      LoadMovieSessions(
                                          movieId: movieEntry.value[index].id,
                                          date: movieEntry.key),
                                    ),
                                  child: SessionPage(
                                      date: movieEntry.key,
                                      movie: movieEntry.value[index]),
                                ),
                              ),
                            ),
                            child: DelayedSlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.0, -1.0),
                                end: const Offset(0.0, 0.0),
                              ),
                              delay: const Duration(
                                milliseconds: 100,
                              ),
                              duration: Duration(
                                milliseconds: 200 ~/ (index + 1),
                              ),
                              child: BlocProvider(
                                create: (context) => FlipCubit(),
                                child: MovieListTile(
                                  movie: movieEntry.value[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text((state as MoviesErrorState).error),
          );
        }
      }),
    );
  }
}
