class Student {
  String name;
  int age;
  Map<String, double> grades;
  List<String> enrolledCourses;

  Student(this.name, this.age)
      : grades = {},
        enrolledCourses = [];

  void enrollInCourse(String course) {
    enrolledCourses.add(course);
    grades[course] = 0.0; // Initialize grade for the new course
    print('$name enrolled in $course.');
  }

  void submitGrade(String course, double grade) {
    if (enrolledCourses.contains(course)) {
      grades[course] = grade;
      print('Marks of $name in $course is $grade.');
    } else {
      print('$name is not enrolled in $course.');
    }
  }

  double calculateGPA() {
    if (grades.isEmpty) return 0.0;

    var totalPoints = 0.0;
    grades.forEach((course, grade) {
      totalPoints += grade;
    });

    return totalPoints / grades.length;
  }

  void displayDetails() {
    print('Student: $name\nAge: $age\nEnrolled Courses: $enrolledCourses');
    if (grades.isNotEmpty) {
      print('Grades: $grades');
      print('GPA: ${calculateGPA().toStringAsFixed(2)}');
    } else {
      print('No grades available yet.');
    }
  }
}

void main() {
  print("---Students Records---\n");
  
  var student1 = Student('Asjad', 20);
  var student2 = Student('Ahmed', 22);

  student1.enrollInCourse('Physics');
  student1.enrollInCourse('Computer');
  
   student1.submitGrade('Physics', 90.5);
  student1.submitGrade('Computer', 85.0);

 
  
  student2.enrollInCourse('Urdu');
  student2.enrollInCourse('English');

  student2.submitGrade('Urdu', 75.0);
  student2.submitGrade('English', 88.5);
  student1.displayDetails();
  print('\n');
  student2.displayDetails();
}
