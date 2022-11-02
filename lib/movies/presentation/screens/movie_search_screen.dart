import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/shared_widget.dart';
import 'package:shimmer/shimmer.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              cursorColor: Colors.white,
              cursorWidth: 1,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a Movie eg.The Notebook',
                hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 18.0,
                      color: const Color(0xff969494),
                    ),
                filled: true,
                fillColor: const Color(0xff2d2d2d),
                contentPadding: const EdgeInsets.only(left: 10.0, top: 10.0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff969494),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff969494),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const ItemBuilder();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListTile(
        title: Text(
          'The NoteBook',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        onTap: () {},
        leading: CachedNetworkImage(
          fit: BoxFit.cover,
          height: double.infinity,
          width: 50,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl:
              'https://image.tmdb.org/t/p/w500/aVX9a54YFmrcEHATubpuFQQKn5L.jpg',
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20.0,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                (7.7).toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          setupDate('2022-2-2'),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
        ),
        autofocus: true,
      ),
    );
  }
}
