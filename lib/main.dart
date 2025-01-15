import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:testproject/widget/calendar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String monthName = DateFormat('MMMM').format(now);
    String formattedDate = DateFormat('MMM dd').format(now);
    int count = CalendarScreen.getCount(now);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(monthName, style: TextStyle(color: Colors.black)),
            centerTitle: true,
            leading: IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/ic_retray.svg')),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month_outlined))]),
        body: Center(
            child: Column(children: [
          SizedBox(height: 8),
          CalendarScreen(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Cycle Day $count - Follicular Phase",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                    Flexible(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          side: BorderSide(color: Colors.grey),
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset('assets/icons/ic_blood.svg'),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "Edit",
                              style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Chip(
                      label: Text(
                        "Medium",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    SizedBox(width: 8),
                    Text("- Chance of getting pregnant"),
                  ],
                ),
              ],
            ),
          ),
        ])));
  }
}
