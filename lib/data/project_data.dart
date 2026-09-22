import 'package:study_flow/models/project.dart';
import 'package:study_flow/models/project_step.dart';

const List<Project> projects = [
  Project(
    id: 'studyflow',
    title: 'StudyFlow',
    description:
        'A Flutter learning app designed to help learners follow a structured roadmap and track their learning progress.',
    difficulty: 'Intermediate',
    technologies: [
      'Flutter',
      'Dart',
      'SharedPreferences',
      'Firebase',
    ],
    features: [
      'Learning roadmap',
      'Course lessons',
      'Lesson completion',
      'Progress tracking',
      'Local data persistence',
    ],
    whyBuild:
        'StudyFlow is designed to turn a large learning journey into smaller, trackable steps.',
    whatYouLearn:
        'Flutter UI development, navigation, state management basics, local persistence, project structure, and Firebase integration.',
    folderStructure: '''
lib/

├── data/
├── models/
├── screens/
├── widgets/
├── firebase_options.dart
└── main.dart
''',
    importantFiles: [
      'main.dart',
      'home_screen.dart',
      'learn_screen.dart',
      'lesson_screen.dart',
      'lesson_details_screen.dart',
      'roadmap_screen.dart',
      'project_screen.dart',
    ],
    badPractices: [
      'Keeping all project data inside one screen',
      'Repeating the same UI code unnecessarily',
      'Mixing data and UI logic',
      'Using unclear variable names',
    ],
    goodPractices: [
      'Keep models separate from UI',
      'Keep reusable data in separate files',
      'Use meaningful names',
      'Keep screens focused on UI and interaction',
    ],
    steps: [
      ProjectStep(
        id: 'studyflow-setup',
        title: 'Project Setup',
        description:
            'Create the Flutter project and configure the basic project environment.',
        objective:
            'Learn how to create a Flutter project, understand the basic project files, run the application, and prepare the development environment.',
        tasks: [
          'Create a new Flutter project.',
          'Open the project in VS Code.',
          'Run the application on Chrome or an emulator.',
          'Understand the pubspec.yaml file.',
          'Check the main Flutter project folders.',
          'Initialize Git for the project.',
        ],
        keyPoints: [
          'Flutter project structure',
          'pubspec.yaml',
          'lib folder',
          'main.dart',
          'Flutter run command',
          'Git repository',
        ],
        example: '''
flutter create study_flow

cd study_flow

flutter run
''',
      ),

      ProjectStep(
        id: 'studyflow-structure',
        title: 'App Structure',
        description:
            'Organize screens, models, data, and reusable widgets into separate folders.',
        objective:
            'Understand how to organize a Flutter application so that screens, data, models, and reusable UI components remain easy to manage.',
        tasks: [
          'Create the required project folders.',
          'Create model classes.',
          'Separate data from UI.',
          'Create reusable widgets.',
        ],
        keyPoints: [
          'models',
          'screens',
          'data',
          'widgets',
          'Separation of responsibilities',
        ],
        example: '''
lib/
├── data/
├── models/
├── screens/
└── widgets/
''',
      ),

      ProjectStep(
        id: 'studyflow-ui',
        title: 'UI Development',
        description:
            'Build the main StudyFlow screens and create a consistent user interface.',
        objective:
            'Learn how to build reusable and consistent Flutter interfaces using widgets, layouts, cards, buttons, and navigation.',
        tasks: [
          'Build the main application screens.',
          'Create reusable UI components.',
          'Apply consistent colors and spacing.',
          'Build navigation between screens.',
        ],
        keyPoints: [
          'Flutter widgets',
          'Layouts',
          'Reusable components',
          'Navigation',
          'UI consistency',
        ],
        example: '''
Scaffold(
  appBar: AppBar(
    title: const Text('StudyFlow'),
  ),
  body: const Center(
    child: Text('Learn Flutter'),
  ),
);
''',
      ),

      ProjectStep(
        id: 'studyflow-learning',
        title: 'Learning System',
        description:
            'Create courses, lessons, lesson details, and lesson completion functionality.',
        objective:
            'Build a structured learning system where users can open courses, study lessons, and mark lessons as completed.',
        tasks: [
          'Create course data.',
          'Create lesson data.',
          'Build the lesson list.',
          'Build lesson details.',
          'Implement lesson completion.',
        ],
        keyPoints: [
          'Course model',
          'Lesson model',
          'Lesson list',
          'Lesson details',
          'Completion state',
        ],
        example: '''
Lesson(
  title: 'Variables',
  description: 'Learn Dart variables.',
);
''',
      ),

      ProjectStep(
        id: 'studyflow-progress',
        title: 'Progress Tracking',
        description:
            'Track completed lessons, roadmap steps, and overall learning progress.',
        objective:
            'Learn how to calculate and display learning progress based on completed lessons and roadmap steps.',
        tasks: [
          'Track completed lessons.',
          'Track completed roadmap steps.',
          'Calculate progress percentage.',
          'Display progress on the Home screen.',
        ],
        keyPoints: [
          'Completed items',
          'Progress calculation',
          'Percentage',
          'Local persistence',
        ],
        example: '''
final progress = completed / total;
''',
      ),

      ProjectStep(
        id: 'studyflow-firebase',
        title: 'Firebase Integration',
        description:
            'Connect Firebase to prepare the application for authentication and cloud data.',
        objective:
            'Understand how Firebase can be connected to a Flutter application and prepare the project for authentication and cloud synchronization.',
        tasks: [
          'Create a Firebase project.',
          'Connect Firebase with Flutter.',
          'Configure Firebase options.',
          'Initialize Firebase.',
        ],
        keyPoints: [
          'Firebase project',
          'Firebase Core',
          'FlutterFire',
          'Firebase initialization',
        ],
        example: '''
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
''',
      ),

      ProjectStep(
        id: 'studyflow-testing',
        title: 'Testing & Polish',
        description:
            'Test the application, fix bugs, improve UI consistency, and prepare the project for release.',
        objective:
            'Learn how to test the complete application, identify problems, improve the interface, and prepare a stable release.',
        tasks: [
          'Test every screen.',
          'Test navigation.',
          'Check progress tracking.',
          'Fix runtime errors.',
          'Improve UI consistency.',
          'Prepare the project for release.',
        ],
        keyPoints: [
          'Testing',
          'Debugging',
          'UI polish',
          'Error handling',
          'Release preparation',
        ],
        example: '''
flutter analyze

flutter run
''',
      ),
    ],
  ),

  Project(
    id: 'flutter-todo',
    title: 'Flutter To-Do App',
    description:
        'A simple task management application where users can create, complete, and manage daily tasks.',
    difficulty: 'Beginner',
    technologies: [
      'Flutter',
      'Dart',
      'SharedPreferences',
    ],
    features: [
      'Add tasks',
      'Complete tasks',
      'Delete tasks',
      'Save tasks locally',
    ],
    whyBuild:
        'A To-Do app is a practical beginner project for understanding Flutter widgets, state, and local data.',
    whatYouLearn:
        'Stateful widgets, lists, forms, user interaction, and local storage.',
    folderStructure: '''
lib/

├── models/
│   └── task.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   └── task_card.dart
└── main.dart
''',
    importantFiles: [
      'main.dart',
      'task.dart',
      'home_screen.dart',
      'task_card.dart',
    ],
    badPractices: [
      'Putting every task operation inside one huge widget',
      'Using hard-coded task data',
      'Repeating task card UI',
    ],
    goodPractices: [
      'Create a Task model',
      'Create reusable task widgets',
      'Keep task logic organized',
    ],
    steps: [
      ProjectStep(
        id: 'todo-setup',
        title: 'Project Setup',
        description:
            'Create the Flutter project and prepare the basic application structure.',
        objective: 'Learn how to create and run a basic Flutter project.',
        tasks: [
          'Create the project.',
          'Run the application.',
          'Check the project structure.',
        ],
        keyPoints: [
          'Flutter project',
          'main.dart',
          'lib folder',
        ],
        example: 'flutter create todo_app',
      ),
      ProjectStep(
        id: 'todo-model',
        title: 'Task Model',
        description:
            'Create a Task model to represent task information such as title and completion status.',
        objective: 'Understand how models represent application data.',
        tasks: [
          'Create Task class.',
          'Add task title.',
          'Add completion status.',
        ],
        keyPoints: [
          'Model',
          'Properties',
          'Boolean state',
        ],
        example: 'class Task {\n  final String title;\n  final bool completed;\n}',
      ),
      ProjectStep(
        id: 'todo-ui',
        title: 'Task UI',
        description:
            'Build the task list and reusable task card interface.',
        objective: 'Learn how to display a list of tasks using reusable widgets.',
        tasks: [
          'Create task list.',
          'Create task card.',
          'Display task information.',
        ],
        keyPoints: [
          'ListView',
          'Card',
          'Reusable widgets',
        ],
        example: 'ListView.builder(\n  itemBuilder: (context, index) {\n    return TaskCard();\n  },\n)',
      ),
      ProjectStep(
        id: 'todo-add-edit',
        title: 'Add & Edit Task',
        description:
            'Allow users to create new tasks and update existing task information.',
        objective: 'Learn how forms and text input work in Flutter.',
        tasks: [
          'Create text input.',
          'Add new task.',
          'Edit existing task.',
        ],
        keyPoints: [
          'TextField',
          'TextEditingController',
          'Forms',
        ],
        example: 'final controller = TextEditingController();',
      ),
      ProjectStep(
        id: 'todo-complete-delete',
        title: 'Complete & Delete Task',
        description:
            'Implement task completion and deletion functionality.',
        objective: 'Learn how user actions modify application state.',
        tasks: [
          'Toggle completion.',
          'Delete a task.',
          'Update the UI.',
        ],
        keyPoints: [
          'State update',
          'Checkbox',
          'Delete action',
        ],
        example: 'task.completed = !task.completed;',
      ),
      ProjectStep(
        id: 'todo-storage',
        title: 'Local Storage',
        description:
            'Save tasks locally so they remain available after restarting the application.',
        objective: 'Understand how local persistence keeps application data between sessions.',
        tasks: [
          'Add SharedPreferences.',
          'Save task data.',
          'Load saved tasks.',
        ],
        keyPoints: [
          'SharedPreferences',
          'Persistence',
          'Save and load',
        ],
        example: 'final prefs = await SharedPreferences.getInstance();',
      ),
    ],
  ),

  Project(
    id: 'notes-app',
    title: 'Notes App',
    description:
        'A simple note-taking application for creating, editing, and managing personal notes.',
    difficulty: 'Beginner',
    technologies: [
      'Flutter',
      'Dart',
      'Local Storage',
    ],
    features: [
      'Create notes',
      'Edit notes',
      'Delete notes',
      'View notes',
    ],
    whyBuild:
        'A Notes App helps learners understand forms, text input, lists, and CRUD-style operations.',
    whatYouLearn:
        'Text controllers, forms, list management, CRUD concepts, and application structure.',
    folderStructure: '''
lib/

├── models/
│   └── note.dart
├── screens/
│   ├── home_screen.dart
│   └── note_details_screen.dart
├── widgets/
│   └── note_card.dart
└── main.dart
''',
    importantFiles: [
      'main.dart',
      'note.dart',
      'home_screen.dart',
      'note_details_screen.dart',
    ],
    badPractices: [
      'Using one screen for every responsibility',
      'Duplicating note UI',
      'Using unclear state variables',
    ],
    goodPractices: [
      'Use a Note model',
      'Separate screens by responsibility',
      'Create reusable widgets',
    ],
    steps: [
      ProjectStep(
        id: 'notes-setup',
        title: 'Project Setup',
        description:
            'Create the Flutter project and prepare the basic application structure.',
        objective: 'Learn how to create and run a basic Flutter project.',
        tasks: [
          'Create the project.',
          'Run the application.',
          'Check the project structure.',
        ],
        keyPoints: [
          'Flutter project',
          'main.dart',
          'lib folder',
        ],
        example: 'flutter create notes_app',
      ),
      ProjectStep(
        id: 'notes-model',
        title: 'Note Model',
        description:
            'Create a Note model to represent note data such as title and content.',
        objective: 'Learn how to represent note information using a model.',
        tasks: [
          'Create Note class.',
          'Add title property.',
          'Add content property.',
        ],
        keyPoints: [
          'Model',
          'Properties',
          'Data structure',
        ],
        example: 'class Note {\n  final String title;\n  final String content;\n}',
      ),
      ProjectStep(
        id: 'notes-list',
        title: 'Notes List UI',
        description:
            'Build the notes list and reusable note card interface.',
        objective: 'Learn how to display multiple notes using reusable widgets.',
        tasks: [
          'Create notes list.',
          'Create note card.',
          'Display note information.',
        ],
        keyPoints: [
          'ListView',
          'Reusable widgets',
          'Card UI',
        ],
        example: 'ListView.builder(\n  itemBuilder: (context, index) {\n    return NoteCard();\n  },\n)',
      ),
      ProjectStep(
        id: 'notes-create',
        title: 'Create Note',
        description:
            'Create a form that allows users to write and save new notes.',
        objective: 'Learn how to create forms and collect user input.',
        tasks: [
          'Create title input.',
          'Create content input.',
          'Save the new note.',
        ],
        keyPoints: [
          'TextField',
          'TextEditingController',
          'Form',
        ],
        example: 'final titleController = TextEditingController();',
      ),
      ProjectStep(
        id: 'notes-edit-delete',
        title: 'Edit & Delete Note',
        description:
            'Allow users to update existing notes and remove notes they no longer need.',
        objective: 'Learn how to update and remove data from an application.',
        tasks: [
          'Open an existing note.',
          'Edit note content.',
          'Delete a note.',
        ],
        keyPoints: [
          'Update',
          'Delete',
          'State management',
        ],
        example: 'notes[index] = updatedNote;',
      ),
      ProjectStep(
        id: 'notes-storage',
        title: 'Local Storage',
        description:
            'Save notes locally so the data remains available after restarting the application.',
        objective: 'Learn how to persist notes between application sessions.',
        tasks: [
          'Choose a local storage solution.',
          'Save notes.',
          'Load notes when the app starts.',
        ],
        keyPoints: [
          'Local storage',
          'Persistence',
          'Save and load',
        ],
        example: 'await saveNotes(notes);',
      ),
    ],
  ),
];