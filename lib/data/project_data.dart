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
      ),
      ProjectStep(
        id: 'studyflow-structure',
        title: 'App Structure',
        description:
            'Organize screens, models, data, and reusable widgets into separate folders.',
      ),
      ProjectStep(
        id: 'studyflow-ui',
        title: 'UI Development',
        description:
            'Build the main StudyFlow screens and create a consistent user interface.',
      ),
      ProjectStep(
        id: 'studyflow-learning',
        title: 'Learning System',
        description:
            'Create courses, lessons, lesson details, and lesson completion functionality.',
      ),
      ProjectStep(
        id: 'studyflow-progress',
        title: 'Progress Tracking',
        description:
            'Track completed lessons, roadmap steps, and overall learning progress.',
      ),
      ProjectStep(
        id: 'studyflow-firebase',
        title: 'Firebase Integration',
        description:
            'Connect Firebase to prepare the application for authentication and cloud data.',
      ),
      ProjectStep(
        id: 'studyflow-testing',
        title: 'Testing & Polish',
        description:
            'Test the application, fix bugs, improve UI consistency, and prepare the project for release.',
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
      ),
      ProjectStep(
        id: 'todo-model',
        title: 'Task Model',
        description:
            'Create a Task model to represent task information such as title and completion status.',
      ),
      ProjectStep(
        id: 'todo-ui',
        title: 'Task UI',
        description:
            'Build the task list and reusable task card interface.',
      ),
      ProjectStep(
        id: 'todo-add-edit',
        title: 'Add & Edit Task',
        description:
            'Allow users to create new tasks and update existing task information.',
      ),
      ProjectStep(
        id: 'todo-complete-delete',
        title: 'Complete & Delete Task',
        description:
            'Implement task completion and deletion functionality.',
      ),
      ProjectStep(
        id: 'todo-storage',
        title: 'Local Storage',
        description:
            'Save tasks locally so they remain available after restarting the application.',
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
      ),
      ProjectStep(
        id: 'notes-model',
        title: 'Note Model',
        description:
            'Create a Note model to represent note data such as title and content.',
      ),
      ProjectStep(
        id: 'notes-list',
        title: 'Notes List UI',
        description:
            'Build the notes list and reusable note card interface.',
      ),
      ProjectStep(
        id: 'notes-create',
        title: 'Create Note',
        description:
            'Create a form that allows users to write and save new notes.',
      ),
      ProjectStep(
        id: 'notes-edit-delete',
        title: 'Edit & Delete Note',
        description:
            'Allow users to update existing notes and remove notes they no longer need.',
      ),
      ProjectStep(
        id: 'notes-storage',
        title: 'Local Storage',
        description:
            'Save notes locally so the data remains available after restarting the application.',
      ),
    ],
  ),
];