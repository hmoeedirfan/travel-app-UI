import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController _pageController;

  int totalPage = 3;

  void onScroll() {}
  @override
  void initState() {
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        onScroll;
      });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makeScreen(
            'assets/images/venice.jpg',
            'Venice',
            'Venice is a city in northeastern Italy and the capital of the Veneto region. It is built on a group of 118 small islands that are separated by expanses of open water and by canals; portions of the city are linked by over 400 bridges.',
            '1',
          ),
          makeScreen(
            'assets/images/victoria_falls.jpg',
            'Victoria Falls',
            "Victoria Falls is a waterfall on the Zambezi River in southern Africa, which provides habitat for several unique species of plants and animals. It is located on the border between Zambia and Zimbabwe and is one of the world's largest waterfalls, with a width of 1,708 m.",
            '2',
          ),
          makeScreen(
            'assets/images/banff national park.jpg',
            'Banff National Park',
            "Banff National Park is Canada’s first national park, established in 1885. From Banff’s humble beginnings as a 26 square kilometre hot springs reserve, Banff National Park now consists of 6,641 square kilometres of unparalleled mountain scenery nestled in the heart of the magnificent Canadian Rockies.",
            '3',
          ),
        ],
      ),
    );
  }

  Widget makeScreen(image, title, message, page) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  page.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/$totalPage',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '4.0',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          '(2000)',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.8,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text(
                      'Read MORE',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
