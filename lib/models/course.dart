class Course {
  final String courseId; //课程代码 B3J063860
  final String courseName; //课程名称 Android平台开发技术
  final String courseAttribute; //课程性质 选修/必修
  final String courseLocation; //校区 学院路校区/沙河校区
  final String courseTeacher; //课程教师 李莹
  final String courseType; //课程类别 博雅类/核心专业类/一般专业类/核心通识类/一般通识类
  final String courseSchool; //开课院系 计算机学院
  final double coursePoint; //学分 1.5
  final int courseSelected; //已选 40
  final int courseCapacity; //容量 80
  final String courseIntroduction; //课程介绍
  final String courseFile;
  final double courseComScore;
  final String courseExamType;
  final int score;
  final int cosLess60;
  final int cos60to70;
  final int cos70to80;
  final int cos80to90;
  final int cos90to100;
  bool isStared;

  Course(
    this.courseId,
    this.courseName,
    this.courseAttribute,
    this.courseLocation,
    this.courseTeacher,
    this.courseType,
    this.courseSchool,
    this.coursePoint,
    this.courseSelected,
    this.courseCapacity,
    this.courseIntroduction,
    this.isStared,
    this.courseFile,
    this.courseComScore,
    this.courseExamType,
    this.score,
      this.cosLess60,
      this.cos60to70,
      this.cos70to80,
      this.cos80to90,
      this.cos90to100,
  );

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json["courseId"]==null ? "" : json["courseId"],
        courseName = json["courseName"]==null ? "" : json["courseName"],
        courseAttribute = json["courseAttribute"]==null ? "" : json["courseAttribute"],
        courseLocation = json["courseLocation"]==null ? "" : json["courseLocation"],
        courseTeacher = json["courseTeacher"]==null ? "" : json["courseTeacher"],
        courseType = json["courseType"]==null ? "" : json["courseType"],
        courseSchool = json["courseSchool"]==null ? "" : json["courseSchool"],
        coursePoint = json["coursePoint"]==null ? 0.0 : json["coursePoint"],
        courseSelected = json["courseSelected"]==null ? 0 : json["courseSelected"],
        courseCapacity = json["courseCapacity"]==null ? 0 : json["courseCapacity"],
        courseIntroduction = json["courseIntroduction"]==null ? "" : json["courseIntroduction"],
        isStared = json["isStared"]==null ? false : json["isStared"],
        courseFile = json["courseFile"]==null ? "" : json["courseFile"],
        score = json["score"]==null ? -1 : json["score"],
        cosLess60 = json["cosLess60"]==null ? 0 : json["cosLess60"] ,
        cos60to70 = json["cos60to70"]==null ? 0 : json["cos60to70"] ,
        cos70to80 = json["cos70to80"]==null ? 0 : json["cos70to80"] ,
        cos80to90 = json["cos80to90"]==null ? 0 : json["cos80to90"] ,
        cos90to100 = json["cos90to100"]==null ? 0 : json["cos90to100"] ,
        courseExamType = json["courseExamType"]==null ? 0 : json["courseExamType"],
        courseComScore = json["courseComScore"] == null ? 0 : json["courseComScore"];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        "courseId": courseId,
        "courseName": courseName,
        "courseAttribute": courseAttribute,
        "courseLocation": courseLocation,
        "courseTeacher": courseTeacher,
        "courseType": courseType,
        "courseSchool": courseSchool,
        "coursePoint": coursePoint,
        "courseSelected": courseSelected,
        "courseCapacity": courseCapacity,
        "courseIntroduction": courseIntroduction,
        "courseFile": courseFile,
        "courseComScore": courseComScore,
        "courseExamType": courseExamType,
        "score": score,
        "isStared": isStared,
        "cosLess60": cosLess60,
        "cos60to70": cos60to70,
        "cos70to80": cos70to80,
        "cos80to90": cos80to90,
        "cos90to100": cos90to100,
      };
}
