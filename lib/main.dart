import 'package:flutter/material.dart';
import 'package:flutter_bloc/length_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LengthBloc lengthBloc = LengthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Flutter Bloc"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StreamBuilder(
                    initialData: 100.0,
                    stream: lengthBloc.stateGreenStream,
                    builder: (context, snapshot) => Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data.toString()),
                        SizedBox(
                          height: 8.0,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: 50.0,
                          height: snapshot.data,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder(
                      initialData: 100.0,
                      stream: lengthBloc.statePurpleStream,
                      builder: (context, snapshot) => Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data.toString()),
                              SizedBox(
                                height: 8.0,
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                width: 50.0,
                                height: snapshot.data,
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                            ],
                          )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      lengthBloc.eventSinkGreen
                          .add(LengthEvents.add_length_green);
                    },
                    child: Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(28.0)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      lengthBloc.eventSinkPurple
                          .add(LengthEvents.add_length_purple);
                    },
                    child: Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(28.0)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
