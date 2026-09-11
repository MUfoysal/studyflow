class Lesson {
  final String title;
  final String description;
  final List<String> keyPoints;
  final String exampleCode;

  Lesson({
    required this.title,
    required this.description,
    required this.keyPoints,
    required this.exampleCode,
  });
}

final List<Lesson> flutterLessons = [
  Lesson(
    title: "What is Flutter?",
    description:
        "Flutter is a UI toolkit developed by Google for building applications.",
    keyPoints: [
      "Flutter is developed by Google.",
      "Flutter uses widgets to build user interfaces.",
      "Flutter can build apps for multiple platforms.",
    ],
    exampleCode: '''
void main() {
  runApp(const MyApp());
}
''',
  ),

  Lesson(
    title: "Why use Flutter?",
    description:
        "Flutter allows developers to build applications for multiple platforms using a single codebase.",
    keyPoints: [
      "Flutter uses a single codebase.",
      "Flutter supports multiple platforms.",
      "Flutter provides fast development with hot reload.",
    ],
    exampleCode: '''
void main() {
  print("Hello Flutter");
}
''',
  ),

  Lesson(
    title: "Flutter Architecture",
    description:
        "Flutter uses widgets and a rendering system to build and display application interfaces.",
    keyPoints: [
      "Flutter UI is built using widgets.",
      "Flutter has its own rendering system.",
      "Widgets can be combined to create complex interfaces.",
    ],
    exampleCode: '''
MaterialApp(
  home: Scaffold(
    body: Text("Hello Flutter"),
  ),
)
''',
  ),
];

final List<Lesson> dartLessons = [
  Lesson(
    title: "What is Dart?",
    description:
        "Dart is a programming language developed by Google and used to build Flutter applications.",
    keyPoints: [
      "Dart is developed by Google.",
      "Flutter uses Dart as its programming language.",
      "Dart supports object-oriented programming.",
    ],
    exampleCode: '''
void main() {
  print("Hello Dart");
}
''',
  ),

  Lesson(
    title: "Variables in Dart",
    description:
        "Variables are used to store data that can be used and changed inside a program.",
    keyPoints: [
      "Variables store values.",
      "Dart supports var, final, and const.",
      "A variable can store different types of data.",
    ],
    exampleCode: '''
var name = "Mohib";
final age = 20;

print(name);
print(age);
''',
  ),

  Lesson(
    title: "Data Types",
    description:
        "Dart provides different data types for storing different kinds of values.",
    keyPoints: [
      "String stores text.",
      "int and double store numbers.",
      "bool stores true or false values.",
    ],
    exampleCode: '''
String name = "Mohib";
int age = 20;
double height = 5.8;
bool isStudent = true;
''',
  ),

  Lesson(
    title: "Operators",
    description:
        "Operators are symbols used to perform calculations and comparisons.",
    keyPoints: [
      "Arithmetic operators perform calculations.",
      "Comparison operators compare values.",
      "Logical operators combine conditions.",
    ],
    exampleCode: '''
int a = 10;
int b = 5;

print(a + b);
print(a > b);
''',
  ),

  Lesson(
    title: "If and Else",
    description:
        "If and else statements are used to make decisions based on conditions.",
    keyPoints: [
      "if checks a condition.",
      "else runs when the condition is false.",
      "else if allows multiple conditions.",
    ],
    exampleCode: '''
int age = 20;

if (age >= 18) {
  print("Adult");
} else {
  print("Minor");
}
''',
  ),

  Lesson(
    title: "Loops",
    description:
        "Loops are used to execute the same block of code multiple times.",
    keyPoints: [
      "for loop is useful when the number of repetitions is known.",
      "while loop runs while a condition is true.",
      "Loops reduce repeated code.",
    ],
    exampleCode: '''
for (int i = 1; i <= 5; i++) {
  print(i);
}
''',
  ),

  Lesson(
    title: "Functions",
    description:
        "Functions are reusable blocks of code designed to perform a specific task.",
    keyPoints: [
      "Functions reduce code repetition.",
      "Functions can accept parameters.",
      "Functions can return values.",
    ],
    exampleCode: '''
int add(int a, int b) {
  return a + b;
}

void main() {
  print(add(10, 5));
}
''',
  ),

  Lesson(
    title: "Lists",
    description:
        "A List is used to store multiple values in a single collection.",
    keyPoints: [
      "Lists store multiple values.",
      "List items use an index.",
      "The first index is 0.",
    ],
    exampleCode: '''
List<String> fruits = [
  "Apple",
  "Banana",
  "Mango",
];

print(fruits[0]);
''',
  ),

  Lesson(
    title: "Maps",
    description:
        "A Map stores data using key-value pairs.",
    keyPoints: [
      "Maps store key-value pairs.",
      "Each key should be unique.",
      "Maps are useful for structured data.",
    ],
    exampleCode: '''
Map<String, dynamic> user = {
  "name": "Mohib",
  "age": 20,
};

print(user["name"]);
''',
  ),

  Lesson(
    title: "Classes and Objects",
    description:
        "Classes define the structure of objects, while objects are instances of classes.",
    keyPoints: [
      "A class is a blueprint.",
      "An object is created from a class.",
      "Classes are fundamental to OOP.",
    ],
    exampleCode: '''
class Student {
  String name = "Mohib";
}

void main() {
  Student student = Student();

  print(student.name);
}
''',
  ),

  Lesson(
    title: "Constructors",
    description:
        "Constructors are special methods used to initialize objects when they are created.",
    keyPoints: [
      "Constructors initialize objects.",
      "A constructor has the same name as the class.",
      "Constructors can receive parameters.",
    ],
    exampleCode: '''
class Student {
  String name;

  Student(this.name);
}

void main() {
  Student student = Student("Mohib");

  print(student.name);
}
''',
  ),

  Lesson(
    title: "Exception Handling",
    description:
        "Exception handling allows a program to handle errors without unexpectedly stopping.",
    keyPoints: [
      "try contains code that may cause an error.",
      "catch handles the error.",
      "Exception handling improves program reliability.",
    ],
    exampleCode: '''
void main() {
  try {
    int result = 10 ~/ 0;
    print(result);
  } catch (e) {
    print("An error occurred");
  }
}
''',
  ),
];
final List<Lesson> gitLessons = [
  Lesson(
    title: "What is Git?",
    description:
        "Git is a version control system used to track changes in a project.",
    keyPoints: [
      "Git tracks changes in files.",
      "Git helps developers manage project versions.",
      "Git works locally on your computer.",
    ],
    exampleCode: '''
git --version
''',
  ),

  Lesson(
    title: "What is GitHub?",
    description:
        "GitHub is a platform used to store, share, and collaborate on Git repositories.",
    keyPoints: [
      "GitHub hosts Git repositories online.",
      "GitHub helps developers collaborate.",
      "GitHub can be used to showcase projects.",
    ],
    exampleCode: '''
git remote -v
''',
  ),

  Lesson(
    title: "Git vs GitHub",
    description:
        "Git and GitHub are related but they serve different purposes.",
    keyPoints: [
      "Git is a version control system.",
      "GitHub is an online platform for Git repositories.",
      "Git can work without GitHub.",
    ],
    exampleCode: '''
git --version
git remote -v
''',
  ),

  Lesson(
    title: "Git Repository",
    description:
        "A Git repository is a project folder where Git tracks files and their changes.",
    keyPoints: [
      "A repository contains project files.",
      "Git stores project history inside the repository.",
      "A repository can be local or connected to GitHub.",
    ],
    exampleCode: '''
git init
''',
  ),

  Lesson(
    title: "Git Init",
    description:
        "The git init command creates a new Git repository inside a project folder.",
    keyPoints: [
      "git init initializes Git.",
      "It creates a .git folder.",
      "It starts tracking the project with Git.",
    ],
    exampleCode: '''
git init
''',
  ),

  Lesson(
    title: "Git Status",
    description:
        "The git status command shows the current state of files in a Git repository.",
    keyPoints: [
      "It shows modified files.",
      "It shows untracked files.",
      "It helps check what will be committed.",
    ],
    exampleCode: '''
git status
''',
  ),

  Lesson(
    title: "Git Add",
    description:
        "The git add command prepares changes to be included in the next commit.",
    keyPoints: [
      "git add stages changes.",
      "You can stage individual files.",
      "You can stage all changes using git add .",
    ],
    exampleCode: '''
git add .
''',
  ),

  Lesson(
    title: "Git Commit",
    description:
        "A commit saves a snapshot of staged changes in the Git history.",
    keyPoints: [
      "Commits create project history.",
      "Each commit should have a meaningful message.",
      "Commits allow you to track previous changes.",
    ],
    exampleCode: '''
git commit -m "Add login screen"
''',
  ),

  Lesson(
    title: "Git Push",
    description:
        "The git push command uploads local commits to a remote repository such as GitHub.",
    keyPoints: [
      "git push sends commits to a remote repository.",
      "It keeps the GitHub repository updated.",
      "You normally push after committing changes.",
    ],
    exampleCode: '''
git push origin main
''',
  ),

  Lesson(
    title: "Git Pull",
    description:
        "The git pull command downloads and integrates changes from a remote repository.",
    keyPoints: [
      "git pull gets changes from a remote repository.",
      "It helps keep your local project updated.",
      "It is useful when working with other developers.",
    ],
    exampleCode: '''
git pull origin main
''',
  ),

  Lesson(
    title: "Git Clone",
    description:
        "The git clone command creates a local copy of a remote Git repository.",
    keyPoints: [
      "git clone downloads a repository.",
      "It creates a local project copy.",
      "It is commonly used to start working on an existing project.",
    ],
    exampleCode: '''
git clone https://github.com/user/project.git
''',
  ),

  Lesson(
    title: "Git Branch",
    description:
        "Branches allow developers to work on different versions or features of a project separately.",
    keyPoints: [
      "Branches isolate development work.",
      "The main branch usually contains the stable project.",
      "Branches are useful for developing new features.",
    ],
    exampleCode: '''
git branch feature-login
git switch feature-login
''',
  ),
];