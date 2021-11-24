import 'package:flutter/material.dart';
import 'package:netflix/netflix_screen/movie_details.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
     getMovies();
  }

  List trending = [];
  List topRatedMovies = [];
  List topPopularMovies = [];
  List topRatedTvShow = [];
  List topPopularTvShow = [];
  var title_='Untitled';

  final apiKey = '2b1885b05d96f468bad962c48ade5d8a';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYjE4ODViMDVkOTZmNDY4YmFkOTYyYzQ4YWRlNWQ4YSIsInN1YiI6IjYxOTFjN2UyNzI0ZGUxMDA0NGY4ODk0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SA1kOiqJ-WiD9ZC018pOlWDR5DpjpkZFLKan3kyytwg';

  Future<void>getMovies() async {
    final TMDB movieGetting = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,

        ));

   final Map trendingMovies =await movieGetting.v3.trending.getTrending();
   final Map popularMovies =await movieGetting.v3.tv.getPouplar();
   final Map popularTvShows =await movieGetting.v3.tv.getPouplar();
   final Map ratedTvShows =await movieGetting.v3.tv.getTopRated();
   final Map ratedMovies =await movieGetting.v3.movies.getTopRated();

    setState(() {
     trending=trendingMovies['results'];
     topPopularMovies=popularMovies['results'];
     topPopularTvShow=popularTvShows['results'];
     topRatedTvShow=ratedTvShows['results'];
     topRatedMovies=ratedMovies['results'];
   });
    print(trending);
  }



  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.40),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          onTap: (value) {
            // Respond to item press.
          },
          items: const [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              title: Text('Coming Soon'),
              icon: Icon(Icons.upcoming),
            ),
            BottomNavigationBarItem(
              title: Text('Fast Laughs'),
              icon: Icon(Icons.emoji_emotions_outlined),
            ),
            BottomNavigationBarItem(
              title: Text('Search'),
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              title: Text('Downloads'),
              icon: Icon(Icons.download_rounded),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              // pinned: true,
              backgroundColor: Colors.transparent,
              expandedHeight: 90.0,
              title: Image.asset(
                'assets/netflix.png',
                scale: 12,
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'TV Shows',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Movies',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ///        introImages Box
                      ///
                      Positioned(
                        top: 1,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/intel-3.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                          height: heightScreen / 1.5,
                          width: widthScreen,
                        ),
                      ),

                      ///    title images
                      Positioned(
                        child: Container(
                          width: widthScreen,
                          height: heightScreen / 1.5,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/intel_title.png',
                                fit: BoxFit.fitWidth,
                                scale: 2.5,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: const [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'My list.dart',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2)),
                                    margin: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    height: 32,
                                    width: 80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(
                                          Icons.play_arrow,
                                          size: 30,
                                        ),
                                        Text(
                                          'Play',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: const [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Info',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///    transparent Color for Appbar
                      Positioned(
                        top: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.black87,
                                Colors.transparent,
                              ])),
                          height: 100,
                          width: widthScreen,
                        ),
                      ),

                      ///        calling SliverAppbar
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            // Text('Popular on Netflix',style: TextStyle(fontSize: 17,color: Colors.yellow),),
            SliverPadding(
              padding: const EdgeInsets.only(left: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Popular on Netflix',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topPopularMovies.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap:() {
                                     title_=topPopularMovies[index]['overview'];print('MMMMMMMMMMMMMMM:@$title_');
                                  Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MovieDetails(title:title_),),);
                          },
                                child: SizedBox(
                                  width: 115.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network( 'https://image.tmdb.org/t/p/w500'+topPopularMovies[index]['poster_path']),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Trending Now',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trending.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: 115.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network( 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Tv Shows',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topRatedMovies.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: 115.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child:Image.network( 'https://image.tmdb.org/t/p/w500'+topRatedMovies[index]['poster_path']),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Top Rated Movies',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 170.0,
                      child: GestureDetector(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: topRatedTvShow.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: 115.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child:Image.network( 'https://image.tmdb.org/t/p/w500'+topRatedTvShow[index]['poster_path']),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Top Rated Tv Shows',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topPopularTvShow.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                child: SizedBox(
                                  width: 115.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child:Image.network( 'https://image.tmdb.org/t/p/w500'+topPopularTvShow[index]['poster_path']),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
