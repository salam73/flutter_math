import 'dart:async';
import 'student.dart';

class StudentBloc {
  final List<Student> _studentList = [
    Student(1, 'Fadi', 85,
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc80bYJdDLcv9xJUpsvKZ1j7ng5RGp8_452w&usqp=CAU.jpg'),
    Student(2, 'Ahmad', 77.5,
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWft7DilpzRhZsduBf_-OKcc_NXZwufVfJBgG8fD-8C9lh5lwd2Ka4aDG0zpDtf0v9V34&usqp=CAU.jpg'),
    Student(3, 'Ammar', 89.5,
        'https://3.bp.blogspot.com/-n832VPK5-jo/VzN6ou9kj8I/AAAAAAAACBk/X6YPnjRBr8UfmbVkClfG6jDEc606PWy3wCLcB/s1600/patrick2.jpg'),
    Student(4, 'Ammar', 89.5,
        'https://3.bp.blogspot.com/-n832VPK5-jo/VzN6ou9kj8I/AAAAAAAACBk/X6YPnjRBr8UfmbVkClfG6jDEc606PWy3wCLcB/s1600/patrick2.jpg'),
    Student(5, 'Ammar', 89.5,
        'https://3.bp.blogspot.com/-n832VPK5-jo/VzN6ou9kj8I/AAAAAAAACBk/X6YPnjRBr8UfmbVkClfG6jDEc606PWy3wCLcB/s1600/patrick2.jpg'),
    Student(6, 'Ammar', 16.989,
        'https://3.bp.blogspot.com/-n832VPK5-jo/VzN6ou9kj8I/AAAAAAAACBk/X6YPnjRBr8UfmbVkClfG6jDEc606PWy3wCLcB/s1600/patrick2.jpg'),
    Student(7, 'Ammar', 89.5,
        'https://3.bp.blogspot.com/-n832VPK5-jo/VzN6ou9kj8I/AAAAAAAACBk/X6YPnjRBr8UfmbVkClfG6jDEc606PWy3wCLcB/s1600/patrick2.jpg'),
    Student(8, 'Khaled', 90,
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU.jpg')
  ];

  //Step 1- Stream Controllers

  final _studentListStreamController = StreamController<List<Student>>();
  final _studentScoreIncrementStreamController = StreamController<Student>();
  final _studentScoreDecrementStreamController = StreamController<Student>();

  //Step 2- Stream and Sink => getters

  Stream<List<Student>> get studentListStream =>
      _studentListStreamController.stream;

  StreamSink<List<Student>> get studentListSink =>
      _studentListStreamController.sink;

  StreamSink<Student> get studentScoreIncrement =>
      _studentScoreIncrementStreamController.sink;

  StreamSink<Student> get studentScoreDecrement =>
      _studentScoreDecrementStreamController.sink;

  //Step 3- Constracter => add data and listen to changes

  StudentBloc() {
    _studentListStreamController.add(_studentList);
    _studentScoreIncrementStreamController.stream.listen(_incrementScore);
    _studentScoreDecrementStreamController.stream.listen(_decrementScore);
  }

  //Step 4- Core Functions

  _incrementScore(Student student) {
    double score = student.score;
    double incrementValue = 0.5;
    if (student.score < 100) {
      _studentList[student.id - 1].score = score + incrementValue;
    }
    studentListSink.add(_studentList);
  }

  _decrementScore(Student student) {
    double score = student.score;
    double decrementValue = 0.5;
    if (student.score > 0) {
      _studentList[student.id - 1].score = score - decrementValue;
    }

    studentListSink.add(_studentList);
  }

  // Step 5-  dispose;

  void dispose() {
    _studentListStreamController.close();
    _studentScoreIncrementStreamController.close();
    _studentScoreDecrementStreamController.close();
  }
}
