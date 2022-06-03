import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Civil Company',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String arBody1 = """خدمه القطاع التقني والصناعي في المملكه • 
      من خلال نقل التكنلوجيا الحديثه
        وتقنيه الطاقه المتجدده  للمملكه من اوربا """;
    String arBody2 =
        """تقدم استشارات  للاداره العليا في الاعمال للكيانات  التجاريه •""";

    Widget contact(label, email) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 63),
            child: SelectableText(label,textAlign: TextAlign.center,)),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: TextFormField(
              textAlign: TextAlign.center,
              enabled: false,
              initialValue: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () => Clipboard.setData(ClipboardData(text: email)),
              icon: const Icon(Icons.copy))
        ],
      );
    }

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          "bg/bg1.jpg",
          fit: BoxFit.fill,
          height: height,
          width: width,
        ),
        Positioned(
            right: width / 20,
            top: height / 10,
            child: Image.asset(
              "logo/logo2.png",
              height: 100,
              width: 700,
            )),
        Positioned(
            right: width / 5.4,
            top: height / 5,
            child: const Text(
              "لنقل التكنلوجيا وتقديم الاستشارات",
              style: TextStyle(
                fontFamily: "Noto",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color((0xFFBDAA8B)),
              ),
            )),
        Positioned(
          right: width / 10,
          top: height / 2.5,
          child: Text(
            arBody1,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: "Noto",
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
            ),
          ),
        ),
        Positioned(
          right: width / 10,
          top: height / 1.75,
          child: Text(
            arBody2,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: "Noto",
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
            ),
          ),
        ),
        Positioned(
          left: width / 10,
          top: height / 3.5,
          child: Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 400.0,
                  height: 400.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFFC7C7C7).withOpacity(0.2)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SelectableText('تواصل معنا',
                            style: TextStyle(
                              fontFamily: "Noto",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color((0xFFBDAA8B)),
                            )),
                        contact("CEO", "ceo@domain.com"),
                        contact("Partners ", "partnership@domain.com"),
                        contact("Marketing", "marketing@domain.com"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
