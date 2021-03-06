import 'package:buaacourse/models/course.dart';
import 'package:buaacourse/screens/course/course_detail.dart';
import 'package:buaacourse/screens/course/http_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Courses extends StatelessWidget{
  final Httpservice httpservice = Httpservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E9EC),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "search_page");
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search)
            ]
        ),
      ),
      body: FutureBuilder(
        future: httpservice.getCourses(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            List<Course> courses = snapshot.data;

            return ListView(
              children: courses.map((Course course) => Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.assignment),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(course.courseName + "-" + course.courseId + "/" + course.courseComScore.toString()),
                  subtitle: Text(course.courseTeacher + "-" + course.coursePoint.toString() + "-" + course.courseExamType
                      + "-" + course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CourseDetail(
                          course: course,
                        )),
                  ),
                ),
              )).toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

_postData() async{
  var apiUrl="https://jsonplaceholder.typicode.com/posts";

  var result = await post(Uri.parse(apiUrl), body: json.encode({"username": "cms", "gender": "c"}));
  if (result.statusCode == 201) {
    print(json.decode(result.body));
  }
  else {
    print(result.statusCode);
  }
}