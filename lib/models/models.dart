// Batch model
import 'package:cloud_firestore/cloud_firestore.dart'
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Batch {
  String name;
  String department;
  String faculty;
  List<String> students;
  String classroom;

  Batch({
    required this.name,
    required this.department,
    required this.faculty,
    required this.students,
    required this.classroom,
  });

  factory Batch.fromJson(Map<String, dynamic> json) => Batch(
        name: json['name'],
        department: json['department'],
        faculty: json['faculty'],
        students: List<String>.from(json['students'].map((x) => x)),
        classroom: json['classroom'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'department': department,
        'faculty': faculty,
        'students': List<dynamic>.from(students.map((x) => x)),
        'classroom': classroom,
      };
}

// Student model
class Student {
  String name;
  String email;
  String batch;

  Student({
    required this.name,
    required this.email,
    required this.batch,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json['name'],
        email: json['email'],
        batch: json['batch'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'batch': batch,
      };
}

// Faculty model
class Faculty {
  String name;
  String email;
  String department;

  Faculty({
    required this.name,
    required this.email,
    required this.department,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
        name: json['name'],
        email: json['email'],
        department: json['department'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'department': department,
      };
}

// Department model
class Department {
  String name;
  List<String> faculties;

  Department({
    required this.name,
    required this.faculties,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        name: json['name'],
        faculties: List<String>.from(json['faculties'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'faculties': List<dynamic>.from(faculties.map((x) => x)),
      };
}

// Classroom model
class Classroom {
  String name;
  int capacity;

  Classroom({
    required this.name,
    required this.capacity,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        name: json['name'],
        capacity: json['capacity'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'capacity': capacity,
      };
}

// Attendance model
class Attendance {
  String date;
  String classroom;
  String faculty;
  Map<String, String> students;

  Attendance({
    required this.date,
    required this.classroom,
    required this.faculty,
    required this.students,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        date: json['date'],
        classroom: json['classroom'],
        faculty: json['faculty'],
        students: Map<String, String>.from(json['students']
            .map((key, value) => MapEntry<String, String>(key, value))),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'classroom': classroom,
        'faculty': faculty,
        'students': Map.fromEntries(
            students.entries.map((e) => MapEntry(e.key, e.value))),
      };
}

// Leave request model
class LeaveRequest {
  String date;
  String student;
  String reason;
  String status;

  LeaveRequest({
    required this.date,
    required this.student,
    required this.reason,
    required this.status,
  });

  factory LeaveRequest.fromJson(Map<String, dynamic> json) => LeaveRequest(
        date: json['date'],
        student: json['student'],
        reason: json['reason'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'student': student,
        'reason': reason,
        'status': status,
      };
}

// Attendance report model
class AttendanceReport {
  String startDate;
  String endDate;
  String batch;
  String faculty;
  Map<String, String> students;

  AttendanceReport({
    required this.startDate,
    required this.endDate,
    required this.batch,
    required this.faculty,
    required this.students,
  });

  factory AttendanceReport.fromJson(Map<String, dynamic> json) =>
      AttendanceReport(
        startDate: json['startDate'],
        endDate: json['endDate'],
        batch: json['batch'],
        faculty: json['faculty'],
        students: Map<String, String>.from(json['students']
            .map((key, value) => MapEntry<String, String>(key, value))),
      );

  Map<String, dynamic> toJson() => {
        'startDate': startDate,
        'endDate': endDate,
        'batch': batch,
        'faculty': faculty,
        'students': Map.fromEntries(
            students.entries.map((e) => MapEntry(e.key, e.value))),
      };
}

//
// These models provide a way to interact with the Firebase database and perform CRUD operations on the different entities such as batches, students, faculties, departments, classrooms, attendance records, leave requests, and attendance reports.

// Batch provider
class BatchProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Batch> _batches = [];

  List<Batch> get batches => _batches;

  Future<void> fetchBatches() async {
    try {
      final snapshot = await _firestore.collection('batches').get();
      final batches =
          snapshot.docs.map((doc) => Batch.fromJson(doc.data())).toList();
      _batches = batches;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addBatch(Batch batch) async {
    try {
      final docRef = await _firestore.collection('batches').add(batch.toJson());
      final newBatch = batch.copyWith(id: docRef.id);
      _batches.add(newBatch);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateBatch(Batch batch) async {
    try {
      await _firestore
          .collection('batches')
          .doc(batch.id)
          .update(batch.toJson());
      final index = _batches.indexWhere((b) => b.id == batch.id);
      _batches[index] = batch;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteBatch(String id) async {
    try {
      await _firestore.collection('batches').doc(id).delete();
      _batches.removeWhere((b) => b.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

// Student provider
class StudentProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> fetchStudents() async {
    try {
      final snapshot = await _firestore.collection('students').get();
      final students =
          snapshot.docs.map((doc) => Student.fromJson(doc.data())).toList();
      _students = students;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addStudent(Student student) async {
    try {
      final docRef =
          await _firestore.collection('students').add(student.toJson());
      final newStudent = student.copyWith(id: docRef.id);
      _students.add(newStudent);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateStudent(Student student) async {
    try {
      await _firestore
          .collection('students')
          .doc(student.id)
          .update(student.toJson());
      final index = _students.indexWhere((s) => s.id == student.id);
      _students[index] = student;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      await _firestore.collection('students').doc(id).delete();
      _students.removeWhere((s) => s.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

// Faculty provider
class FacultyProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Faculty> _faculties = [];

  List<Faculty> get faculties => _faculties;

  Future<void> fetchFaculties() async {
    try {
      final snapshot = await _firestore.collection('faculty').get();
      final faculties =
          snapshot.docs.map((doc) => Faculty.fromJson(doc.data())).toList();
      _faculties = faculties;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addFaculty(Faculty faculty) async {
    try {
      final docRef =
          await _firestore.collection('faculties').add(faculty.toJson());
      final newFaculty = faculty.copyWith(id: docRef.id);
      _faculties.add(newFaculty);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateFaculty(Faculty faculty) async {
    try {
      await _firestore
          .collection('faculties')
          .doc(faculty.id)
          .update(faculty.toJson());
      final index = _faculties.indexWhere((f) => f.id == faculty.id);
      _faculties[index] = faculty;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteFaculty(String id) async {
    try {
      await _firestore.collection('faculties').doc(id).delete();
      _faculties.removeWhere((f) => f.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

// Department provider
class DepartmentProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Department> _departments = [];

  List<Department> get departments => _departments;

  Future<void> fetchDepartments() async {
    try {
      final snapshot = await _firestore.collection('departments').get();
      final departments =
          snapshot.docs.map((doc) => Department.fromJson(doc.data())).toList();
      _departments = departments;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addDepartment(Department department) async {
    try {
      final docRef =
          await _firestore.collection('departments').add(department.toJson());
      final newDepartment = department.copyWith(id: docRef.id);
      _departments.add(newDepartment);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateDepartment(Department department) async {
    try {
      await _firestore
          .collection('departments')
          .doc(department.id)
          .update(department.toJson());
      final index = _departments.indexWhere((d) => d.id == department.id);
      _departments[index] = department;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteDepartment(String id) async {
    try {
      await _firestore.collection('departments').doc(id).delete();
      _departments.removeWhere((d) => d.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

// Classroom provider
class ClassroomProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Classroom> _classrooms = [];

  List<Classroom> get classrooms => _classrooms;

  Future<void> fetchClassrooms() async {
    try {
      final snapshot = await _firestore.collection('classrooms').get();
      final classrooms =
          snapshot.docs.map((doc) => Classroom.fromJson(doc.data())).toList();
      _classrooms = classrooms;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addClassroom(Classroom classroom) async {
    try {
      final docRef =
          await _firestore.collection('classrooms').add(classroom.toJson());
      final newClassroom = classroom.copyWith(id: docRef.id);
      _classrooms.add(newClassroom);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateClassroom(Classroom classroom) async {
    try {
      await _firestore
          .collection('classrooms')
          .doc(classroom.id)
          .update(classroom.toJson());
      final index = _classrooms.indexWhere((c) => c.id == classroom.id);
      _classrooms[index] = classroom;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteClassroom(String id) async {
    try {
      await _firestore.collection('classrooms').doc(id).delete();
      _classrooms.removeWhere((c) => c.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
