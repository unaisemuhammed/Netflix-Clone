import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  var title;
    MovieDetails({Key?key,required this.title}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(child: Stack(
        children: [
          Positioned(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Image.asset('assets/intel-back.jpg'),
                      width: widthScreen,
                      height: heightScreen/3,
                    ),
                    Row(children: [
                      Image.asset(
                        'assets/netflix.png',
                        scale: 20
                      ),
                      const Text('FILM',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white70),)
                    ],), Text(widget.title.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    Container(
                     child: Row(
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: const [
                         Icon(Icons.play_arrow,color: Colors.black,),
                         SizedBox(width: 5,),
                         Text('Resume',style: TextStyle(fontSize:19,fontWeight: FontWeight.bold,color: Colors.black),)
                       ],
                     ),
                      width: widthScreen,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),),
                    const SizedBox(height: 10,),
                    Container(
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.download_rounded,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text('Downloads',style: TextStyle(fontSize:19,fontWeight: FontWeight.w500,color: Colors.white),)
                        ],
                      ),
                      width: widthScreen,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(5)
                      ),),
                    const SizedBox(height: 30,),
                     Text("jhg",
                        style: const TextStyle(fontSize:15,color: Colors.white)),
                    const SizedBox(height: 10,),
                    const Text('Cast:Joey King,Joel Courtney,Jacob Elodie.....more',
                        style: TextStyle(fontSize:12,color: Colors.grey)),
                    const Text('Director:Joey King,Joel Courtney,',
                        style: TextStyle(fontSize:12,color: Colors.grey)),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        const SizedBox(width: 20,),
                      Column(
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,size: 30,
                          ),
                          Text(
                            'My list.dart',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                        const SizedBox(width: 80,),
                        Column(
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'Rate',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                        const SizedBox(width: 80,),
                        Column(
                        children: const [
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          Text(
                            'My list.dart',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                    ],),
                    const SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  const [
                        SizedBox(width: 10,),
                            Text(
                              'Collection',
                                style: TextStyle(fontSize:17,fontWeight: FontWeight.w500,color: Colors.white)

                        ),
                        SizedBox(width: 30,),
                        Text(
                          'More Like This',
                            style: TextStyle(fontSize:17,fontWeight: FontWeight.w500,color: Colors.grey)

                        ),
                        SizedBox(width: 30,),
                        Text(
                          'Trailer & More',
                            style: TextStyle(fontSize:17,fontWeight: FontWeight.w500,color: Colors.grey)

                        ),
                      ],),
                    Column(
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
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 115.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset('assets/intel-3.jpg'),
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
                  ],
                ),
              ],
            ),
          ),),
        ],
      ),

      ),
    );
  }
}
