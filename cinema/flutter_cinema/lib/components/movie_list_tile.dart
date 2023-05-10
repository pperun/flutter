import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/components/caption.dart';

import '../bloc/flip_cubit/flip_cubit.dart';
import '../models/movie.dart';
import 'flippable.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;

  const MovieListTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<FlipCubit, bool>(
        builder: (context, state) {
          return Flippable(
            frontSide: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      movie.image,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) =>
                              AnimatedOpacity(
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: frame == null
                            ? const AspectRatio(
                                aspectRatio: 2 / 3,
                              )
                            : child,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Caption(
                          text: 'IMDb: ${movie.rating}',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Caption(
                          text: '${movie.age}+',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Caption(
                      text: movie.language,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Caption(
                      text: movie.name,
                      type: CaptionType.large,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => context.read<FlipCubit>().flip(),
                      child: const Caption(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backSide: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: DefaultTextStyle.merge(
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${movie.name}, ${movie.year}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Text('Country: ${movie.country}'),
                          Text('Genre: ${movie.genre}'),
                          Text('Language: ${movie.language}'),
                          Text(
                              'Duration: ${movie.duration.inMinutes.toString()} minutes'),
                          Text('Rating: ${movie.rating.toString()}'),
                          Text('Director: ${movie.director}'),
                          Text('Screen writer: ${movie.screenWriter}'),
                          Text('Cast: ${movie.starring}'),
                          Text('Studio: ${movie.studio}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 48),
                            child: Text(
                              movie.plot,
                              style: const TextStyle(
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () => context.read<FlipCubit>().flip(),
                    child: const Caption(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
