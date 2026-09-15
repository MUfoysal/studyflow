# StudyFlow

A Flutter-based learning application designed to help learners follow a structured learning path, complete lessons, track progress, and practice through projects.

## Overview

StudyFlow helps learners turn a large learning journey into smaller, trackable steps.

The current V1 focuses on a local-first learning experience with course lessons, roadmap tracking, progress persistence, and practical projects.

## Features

* Splash screen
* Home dashboard
* Learning courses
* Lesson-based learning
* Lesson details
* Lesson completion tracking
* Progress tracking
* Roadmap
* Roadmap step completion
* Local progress persistence
* Project learning section
* Project details and best practices
* Bottom navigation

## Tech Stack

* Flutter
* Dart
* SharedPreferences
* Firebase Core

## Project Structure

```text
lib/
├── data/
│   └── project_data.dart
│
├── models/
│   ├── lesson.dart
│   └── project.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── learn_screen.dart
│   ├── lesson_screen.dart
│   ├── lesson_details_screen.dart
│   ├── roadmap_screen.dart
│   ├── roadmap_detail_screen.dart
│   ├── project_screen.dart
│   ├── project_details_screen.dart
│   ├── main_screen.dart
│   └── splash_screen.dart
│
├── firebase_options.dart
└── main.dart
```

## V1 Learning Flow

```text
Splash
  ↓
Home
  ↓
Learn
  ↓
Course
  ↓
Lessons
  ↓
Lesson Details
  ↓
Complete Lesson
  ↓
Progress Tracking
  ↓
Roadmap
  ↓
Projects
  ↓
Project Details
```

## Local Data

StudyFlow V1 uses `SharedPreferences` to store learning progress locally.

This allows completed lessons and roadmap progress to remain available after restarting the application.

## Project Section

The Projects section provides practical project ideas and learning guidance.

Each project includes:

* Project overview
* Difficulty level
* Technologies
* Features
* Why build it
* Folder structure
* Important files
* Bad practices
* Good practices
* Learning outcomes

## Version

Current version:

```text
1.0.0+1
```

V1 represents the first stable local learning experience of StudyFlow.

## Future Development

Future versions may introduce features such as:

* Firebase Authentication
* User profiles
* Cloud Firestore
* Cloud progress synchronization
* User-specific learning data

## Author

**Mohib Ullah Foysal**

GitHub: **MUfoysal**

StudyFlow is being developed as a practical project for learning Flutter and modern application development.
