import 'package:fa1_tasbeeh/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>CounterCubit()),
        ],
        child:  MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final counterCubit=context.read<CounterCubit>();

    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 32, 45, 1),

      appBar: AppBar(
        title: Text('Tasbih Counter'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        backgroundColor: Colors.transparent,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),
          Container(
            child: Text(
              'عداد التسبيح',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 20),

          BlocBuilder<CounterCubit,int>(
            builder: (context, count){
              return Text("${count}",
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  )
              );
            },
          ),

          SizedBox(height: 20),
          Container(
            child: Text(
              'Tap to count',
              style: TextStyle(fontSize: 25, color: Colors.white60),
            ),
          ),

          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              counterCubit.increment();
            },
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: Center(
                child: Icon(Icons.add, size: 40, color: Colors.white),
              ),
            ),
          ),

          SizedBox(height: 70),
          Center(
            child: Container(
              width: 250,
              height: 70,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      counterCubit.reset();
                    },
                    icon: Icon(Icons.refresh, color: Colors.white60, size: 35),
                  ),
                  IconButton(
                    onPressed: () {
                      counterCubit.decrement();
                    },
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.white60,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
