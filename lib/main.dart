import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(title: "Tasbih Counter"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  static final ValueNotifier<int> _count = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 32, 45, 1),

      appBar: AppBar(
        title: Text('Tasbih Counter'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.menu
              )
          ),
        ],
        backgroundColor: Colors.transparent,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 100),
            Container(
              child: Text(
                'عداد التسبيح',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: _count,
              builder: (context, value, _) => Text(
                value.toString().padLeft(3, '0'),
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ),


            SizedBox(height: 20,),
            Container(
              child: Text(
                'Tap to count',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white60,
                ),
              ),
            ),

            SizedBox(height: 5),
            GestureDetector(
              onTap: (){
                if(_count.value<999) _count.value +=1;
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                ),
                child: Center(
                  child: Icon(
                    Icons.add, size: 40,color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 70),
            Center(
              child:
              Container(
                width: 250,
                height: 70,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _count.value = 0;
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white60,
                          size: 35,
                        )
                    ),
                    IconButton(
                        onPressed: () {
                          _count.value = 0;
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white60,
                          size: 35,
                        )
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 2),


          ],
      ),

    );
  }



}
