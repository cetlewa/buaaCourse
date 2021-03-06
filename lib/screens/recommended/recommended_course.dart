import 'package:buaacourse/models/course.dart';
import 'package:buaacourse/screens/recommended/recourse_detail.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:http/http.dart';
import 'dart:convert';

class RecommendedCourse extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RecommendedCourse();

}

class _RecommendedCourse extends State<RecommendedCourse> {
  final Httpservice httpservice = Httpservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("系统为您智能推荐的课表"),
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
                  title: Text(course.courseName + "-" + course.courseId),
                  subtitle: Text(course.courseTeacher + "-" + course.coursePoint.toString()
                      + "-" + course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ReCourseDetail(
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

class Httpservice {
  final String postsUrl = Global.baseUrl + "queryRecomCourse";

  Future<List<Course>> getCourses() async {
    Response response = await post(
      Uri.parse(postsUrl),
      body: json.encode({
        "userId": Global.globalUser.userId,
      }),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print(response.body);

      List<Course> courses =
      body.map((dynamic item) => Course.fromJson(item)).toList();

      return courses;
    } else {
      throw "Can't get posts.";
    }
  }
}