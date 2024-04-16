import 'dart:convert';

import 'package:elderselettricomobile/presentation/setting/test/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeTest extends StatefulWidget {
  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  TextEditingController name = TextEditingController();

  TextEditingController job = TextEditingController();

  List firstData = [];

  ServiceProfile serviceProfile = ServiceProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Testt'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
                bottom: 0,
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: name,
                decoration: InputDecoration(
                  hintText: 'name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
                bottom: 0,
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: job,
                decoration: InputDecoration(
                  hintText: 'job',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  ServiceProfile.postData(
                    name.text,
                    job.text,
                  ).then((value) {
                    print(value.name);
                    setState(() {
                      firstData.add(value);
                      serviceProfile = value;
                    });
                  });
                },
                child: Text('POST DATA'),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: firstData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text(
                      (serviceProfile.name != null)
                          ? '${serviceProfile.name}'
                          : 'No Name',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      (serviceProfile.name != null)
                          ? '${serviceProfile.job}'
                          : 'No Job',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Text(
                      (serviceProfile.createdAt != null)
                          ? '${serviceProfile.createdAt}'
                          : 'No Job',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
