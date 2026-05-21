
import 'package:quiz_app/model/category_model.dart';
import 'package:quiz_app/model/quiz_enum.dart';
import 'package:quiz_app/model/quiz_model.dart';

class DataController {
  static Map<String,QuizCategory> categories = {
  "1":QuizCategory(name: "Flutter",id:"1",noOfQuize: 5),
  "2":QuizCategory(name: "React",id:"2",noOfQuize: 3),
  "3":QuizCategory(name: "Node",id:"3",noOfQuize: 4),
  "4":QuizCategory(name: "Odoo",id:"4",noOfQuize: 0)
  };

  static List<Quiz> quizes=[
  Quiz(
    difficultyLevel: Level.easy,
    quizeName: "Flutter Essentials",
    questions: [
      QuizQuestion(
        question: "Which function starts Flutter app?",
        options: [
          "startApp()",
          "runApp()",
          "mainApp()",
          "launchApp()",
        ],
        answer: 1,
      ),
      QuizQuestion(
        question: "Which widget centers child widget?",
        options: ["Align", "Padding", "Center", "Positioned"],
        answer: 2,
      ),
      QuizQuestion(
        question:
            "Which widget creates scrollable list?",
        options: ["Row", "Column", "Stack", "ListView"],
        answer: 3,
      ),
      QuizQuestion(
        question: "Which widget is used for clickable button?",
        options: ["ElevatedButton", "Text", "Icon", "Scaffold"],
        answer: 0,
      ),
      QuizQuestion(
        question: "Which keyword creates immutable variable?",
        options: ["dynamic", "final", "var", "late"],
        answer: 1,
      ),
      QuizQuestion(
        question:
            "Which widget is used for icon display?",
        options: ["Symbol", "Icon", "IconView", "ImageIcon"],
        answer: 1,
      ),
      QuizQuestion(
        question: "Which method updates UI in StatefulWidget?",
        options: ["refresh()", "rebuild()", "setState()", "updateUI()"],
        answer: 2,
      ),
      QuizQuestion(
        question: "Which widget expands to available space?",
        options: [
          "Spacer",
          "Expanded",
          "Flexible",
          "SizedBox",
        ],
        answer: 1,
      ),
      QuizQuestion(
        question: "Which package manages local storage?",
        options: ["provider", "http", "shared_preferences", "intl"],
        answer: 2,
      ),
      QuizQuestion(
        question: "Which widget stacks widgets over each other?",
        options: ["Row", "Stack", "Wrap", "GridView"],
        answer: 1,
      ),
    ],
    categoryID: "1",
    
  ),
  Quiz(difficultyLevel: Level.easy,
    quizeName: "Flutter Basics",
    questions: [
      QuizQuestion(
        question: "What is Flutter?",
        options: [
          "Database management system",
          "UI toolkit for building applications",
          "Programming language",
          "Web browser",
        ],
        answer: 1,
      ),
      QuizQuestion(
        question: "Which programming language is used by Flutter?",
        options: ["Java", "Kotlin", "Dart", "Swift"],
        answer: 2,
      ),
      QuizQuestion(
        question:
            "Which widget is used as the root of a Flutter app following Material Design?",
        options: ["Scaffold", "Container", "MaterialApp", "SafeArea"],
        answer: 2,
      ),
      QuizQuestion(
        question: "Which widget is used to create an app bar in Flutter?",
        options: ["AppBar", "ToolBar", "HeaderBar", "TopBar"],
        answer: 0,
      ),
      QuizQuestion(
        question: "Which widget is used for arranging widgets vertically?",
        options: ["Row", "Stack", "Column", "ListView"],
        answer: 2,
      ),
      QuizQuestion(
        question:
            "Which widget is commonly used for screen structure in Flutter?",
        options: ["Scaffold", "SafeArea", "Card", "Icon"],
        answer: 0,
      ),
      QuizQuestion(
        question: "Which widget is used for arranging widgets horizontally?",
        options: ["Column", "Row", "Stack", "Expanded"],
        answer: 1,
      ),
      QuizQuestion(
        question: "What is the purpose of setState() in Flutter?",
        options: [
          "Delete widget",
          "Navigate between screens",
          "Update UI when state changes",
          "Create animation",
        ],
        answer: 2,
      ),
      QuizQuestion(
        question: "Which widget is used to add space around another widget?",
        options: ["SizedBox", "Padding", "Expanded", "Center"],
        answer: 1,
      ),
      QuizQuestion(
        question: "Which widget allows scrolling in Flutter?",
        options: ["Expanded", "Padding", "ListView", "Align"],
        answer: 2,
      ),
    ],
    categoryID: "1"
  ),
  Quiz(
    difficultyLevel: Level.medium,
  quizeName: "Intermediate Flutter Concepts",
  questions: [
    QuizQuestion(
      question: "Which widget is used for grid layout?",
      options: ["GridView", "ListView", "Column", "Stack"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which lifecycle method runs only once?",
      options: ["build()", "dispose()", "initState()", "setState()"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget avoids system UI overlap?",
      options: ["Padding", "SafeArea", "Align", "Expanded"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which package is commonly used for API calls?",
      options: ["http", "intl", "provider", "path"],
      answer: 0,
    ),
    QuizQuestion(
      question: "What is Future used for?",
      options: [
        "Animation",
        "Database",
        "Async operations",
        "Navigation",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget helps flexible layout?",
      options: ["Flexible", "Padding", "Card", "Center"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which method opens a new screen?",
      options: [
        "Navigator.pop()",
        "Navigator.push()",
        "Navigator.remove()",
        "Navigator.clear()",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which widget creates lazy lists?",
      options: [
        "Column",
        "ListBody",
        "ListView.builder",
        "Wrap",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget rebuilds using ValueNotifier?",
      options: [
        "Builder",
        "FutureBuilder",
        "ValueListenableBuilder",
        "GestureDetector",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget detects tap gestures?",
      options: [
        "GestureDetector",
        "MouseRegion",
        "Container",
        "Stack",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which widget shows loading spinner?",
      options: [
        "ProgressBar",
        "Loader",
        "CircularProgressIndicator",
        "Spinner",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget creates pull-to-refresh?",
      options: [
        "RefreshIndicator",
        "RefreshWidget",
        "Loader",
        "Indicator",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which widget creates animation between screens?",
      options: [
        "Hero",
        "AnimatedContainer",
        "FadeTransition",
        "Transform",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which property adds rounded corners?",
      options: [
        "curve",
        "radius",
        "borderRadius",
        "shape",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which lifecycle method cleans resources?",
      options: [
        "dispose()",
        "build()",
        "initState()",
        "didUpdateWidget()",
      ],
      answer: 0,
    ),
  ],
  categoryID: "1",
),
  Quiz(
    difficultyLevel: Level.hard,
  quizeName: "Advanced Flutter Mastery",
  questions: [
    QuizQuestion(
      question: "Purpose of Keys in Flutter?",
      options: [
        "Styling",
        "Unique widget identification",
        "Routing",
        "Animation",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which rendering engine is used by Flutter?",
      options: ["Blink", "Gecko", "Skia", "WebKit"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget provides inherited data?",
      options: [
        "InheritedWidget",
        "FutureBuilder",
        "Container",
        "Builder",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "What does const optimization do?",
      options: [
        "Prevents rebuild",
        "Creates animation",
        "Increases memory",
        "Deletes cache",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which widget listens to streams?",
      options: [
        "FutureBuilder",
        "ValueListenableBuilder",
        "StreamBuilder",
        "Builder",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Purpose of mixins in Dart?",
      options: [
        "Database",
        "Multiple inheritance behavior",
        "API calls",
        "Routing",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which command builds release APK?",
      options: [
        "flutter apk build",
        "flutter build apk --release",
        "flutter release apk",
        "flutter run release",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "What does ensureInitialized() do?",
      options: [
        "Build UI",
        "Initialize Flutter before async calls",
        "Create widgets",
        "Restart engine",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which widget is best for optimized long lists?",
      options: [
        "Column",
        "Wrap",
        "ListView.builder",
        "ListBody",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "What is isolate in Dart?",
      options: [
        "Widget",
        "Background thread",
        "Database",
        "Theme",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which widget animates container properties?",
      options: [
        "AnimatedContainer",
        "Hero",
        "Transform",
        "FadeTransition",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which widget rebuilds for future completion?",
      options: [
        "Builder",
        "FutureBuilder",
        "Hero",
        "Expanded",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which package is popular for state management?",
      options: [
        "provider",
        "path",
        "intl",
        "crypto",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "What is pubspec.yaml used for?",
      options: [
        "Layouts",
        "Dependencies and assets",
        "Navigation",
        "API calls",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which widget creates custom painting?",
      options: [
        "CanvasWidget",
        "Painter",
        "CustomPaint",
        "ShapeWidget",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget overlays widgets?",
      options: [
        "Stack",
        "Column",
        "Wrap",
        "GridView",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which widget is immutable?",
      options: [
        "StatefulWidget",
        "State",
        "StatelessWidget",
        "InheritedWidget",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which command runs Flutter app?",
      options: [
        "flutter execute",
        "flutter run",
        "flutter start",
        "flutter launch",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which widget helps responsive sizing?",
      options: [
        "Expanded",
        "SizedBox",
        "Positioned",
        "Divider",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which widget displays material card?",
      options: [
        "Card",
        "Paper",
        "Panel",
        "Tile",
      ],
      answer: 0,
    ),
  ],
  categoryID: "1",
),
  Quiz(difficultyLevel:Level.medium,
  quizeName: "Flutter Rapid Fire",
  questions: [
    QuizQuestion(
      question: "Which language is used by Flutter?",
      options: ["Java", "Swift", "Dart", "Kotlin"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget creates vertical layout?",
      options: ["Row", "Column", "Stack", "Wrap"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which widget displays text?",
      options: ["Label", "Text", "Typography", "TextView"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which widget provides app structure?",
      options: ["Scaffold", "Container", "Center", "Padding"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which widget is scrollable?",
      options: ["Column", "ListView", "Center", "Padding"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which method rebuilds UI?",
      options: ["refresh()", "build()", "setState()", "render()"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which widget stacks children?",
      options: ["Row", "Stack", "Wrap", "GridView"],
      answer: 1,
    ),
  ],
  categoryID: "1",
),
  Quiz(
    difficultyLevel: Level.easy,
  quizeName: "React Basics",
  questions: [
    QuizQuestion(
      question: "Which company developed React?",
      options: ["Google", "Facebook", "Microsoft", "Apple"],
      answer: 1,
    ),
    QuizQuestion(
      question: "What is React primarily used for?",
      options: [
        "Database management",
        "Backend development",
        "Building UI",
        "Operating systems",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which syntax extension is used in React?",
      options: ["TSX", "JSX", "XML", "HTML+"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which hook is used for state management?",
      options: ["useRef", "useMemo", "useState", "useEffect"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which command creates React app?",
      options: [
        "npx create-react-app",
        "react new",
        "npm react-app",
        "create react",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "What is a React component?",
      options: [
        "Database",
        "Reusable UI block",
        "CSS file",
        "Package manager",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which prop is required for list rendering?",
      options: ["index", "id", "key", "value"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which hook handles side effects?",
      options: ["useEffect", "useState", "useReducer", "useRef"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which method renders React app?",
      options: [
        "ReactDOM.render()",
        "React.start()",
        "renderApp()",
        "createRoot() only",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which symbol is used for fragments?",
      options: ["<> </>", "[]", "{}", "()"],
      answer: 0,
    ),
  ],
  categoryID: "2",
),
  Quiz(
    difficultyLevel: Level.medium,
  quizeName: "Intermediate React",
  questions: [
    QuizQuestion(
      question: "What is Virtual DOM?",
      options: [
        "Database",
        "Copy of real DOM",
        "CSS engine",
        "API server",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which hook stores mutable values without re-render?",
      options: ["useState", "useEffect", "useRef", "useMemo"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which hook optimizes expensive calculations?",
      options: ["useEffect", "useMemo", "useRef", "useContext"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Props in React are?",
      options: [
        "Mutable",
        "Immutable",
        "Functions",
        "Hooks",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which hook shares data globally?",
      options: [
        "useReducer",
        "useContext",
        "useMemo",
        "useRef",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which method updates state in class component?",
      options: [
        "updateState()",
        "setState()",
        "changeState()",
        "refreshState()",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "What is conditional rendering?",
      options: [
        "Rendering based on condition",
        "Loop rendering",
        "API rendering",
        "Server rendering",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which package handles routing in React?",
      options: [
        "react-router-dom",
        "react-navigation",
        "router-react",
        "route-dom",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which lifecycle method runs after component mounts?",
      options: [
        "componentWillUnmount",
        "componentDidMount",
        "render",
        "constructor",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which hook replaces lifecycle methods mostly?",
      options: [
        "useState",
        "useRef",
        "useEffect",
        "useMemo",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "What does lifting state up mean?",
      options: [
        "Deleting state",
        "Moving state to parent",
        "Global state",
        "Optimizing hooks",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which attribute is used for CSS class in JSX?",
      options: ["class", "cssClass", "className", "styleClass"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which hook manages complex state?",
      options: [
        "useEffect",
        "useReducer",
        "useRef",
        "useMemo",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "What is controlled component?",
      options: [
        "DOM controlled form",
        "State controlled form",
        "Backend controlled form",
        "Static form",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which function prevents default browser action?",
      options: [
        "preventDefault()",
        "stopBrowser()",
        "cancelAction()",
        "blockDefault()",
      ],
      answer: 0,
    ),
  ],
  categoryID: "2",
),
  Quiz(
    difficultyLevel: Level.hard,
  quizeName: "Advanced React",
  questions: [
    QuizQuestion(
      question: "What is React Fiber?",
      options: [
        "CSS framework",
        "Rendering engine",
        "Database",
        "Routing library",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which hook memoizes functions?",
      options: [
        "useMemo",
        "useCallback",
        "useRef",
        "useEffect",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Purpose of React.memo?",
      options: [
        "Routing",
        "Prevent unnecessary re-renders",
        "API handling",
        "Animation",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which rendering type improves SEO?",
      options: [
        "CSR",
        "SSR",
        "Hydration",
        "Lazy Loading",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which framework supports SSR with React?",
      options: [
        "Vue",
        "Angular",
        "Next.js",
        "Express",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "What is hydration in React?",
      options: [
        "CSS loading",
        "Attaching events to SSR HTML",
        "Database sync",
        "API optimization",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which hook accesses context values?",
      options: [
        "useContext",
        "useMemo",
        "useRef",
        "useReducer",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which feature loads components lazily?",
      options: [
        "React.lazy",
        "useMemo",
        "useEffect",
        "ReactDOM",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which component handles errors in subtree?",
      options: [
        "ErrorBoundary",
        "CatchBoundary",
        "ErrorHandler",
        "TryCatch",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which hook is used for DOM access?",
      options: [
        "useState",
        "useEffect",
        "useRef",
        "useMemo",
      ],
      answer: 2,
    ),
  ],
  categoryID: "2",
),
  Quiz(
    difficultyLevel: Level.easy,
  quizeName: "Node.js Basics",
  questions: [
    QuizQuestion(
      question: "What is Node.js?",
      options: [
        "Frontend framework",
        "JavaScript runtime",
        "Database",
        "CSS library",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which engine powers Node.js?",
      options: ["SpiderMonkey", "V8", "JavaScriptCore", "Gecko"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which command initializes Node project?",
      options: [
        "node init",
        "npm init",
        "node start",
        "npm start",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which file stores project dependencies?",
      options: [
        "node.json",
        "package.json",
        "config.json",
        "dependencies.json",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which module handles file system operations?",
      options: ["http", "os", "fs", "path"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which keyword exports module?",
      options: [
        "export",
        "exports",
        "module.exports",
        "return",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which package manager comes with Node.js?",
      options: ["yarn", "npm", "pnpm", "bower"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which module creates web server?",
      options: ["url", "http", "events", "stream"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which method reads file asynchronously?",
      options: [
        "fs.read()",
        "fs.readFile()",
        "fs.open()",
        "fs.getFile()",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which object represents current module?",
      options: [
        "module",
        "exports",
        "__dirname",
        "global",
      ],
      answer: 0,
    ),
  ],
  categoryID: "3",
),
  Quiz(
  difficultyLevel: Level.medium,
  quizeName: "Intermediate Node.js",
  questions: [
    QuizQuestion(
      question: "What is middleware in Express?",
      options: [
        "Database",
        "Function between request and response",
        "Frontend component",
        "Server file",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which framework is popular with Node.js?",
      options: ["Laravel", "Django", "Express", "Flutter"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which method handles GET request in Express?",
      options: [
        "app.post()",
        "app.put()",
        "app.get()",
        "app.fetch()",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which object contains request data?",
      options: ["req", "res", "app", "server"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which object sends response?",
      options: ["req", "res", "body", "route"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which package reloads server automatically?",
      options: ["reload", "nodemon", "express", "pm2"],
      answer: 1,
    ),
    QuizQuestion(
      question: "What is callback function?",
      options: [
        "Loop",
        "Function passed into another function",
        "Object",
        "Middleware",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which module handles paths?",
      options: ["http", "path", "fs", "os"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which keyword handles async errors?",
      options: ["catch", "error", "throw", "stop"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which syntax handles asynchronous code cleanly?",
      options: [
        "callbacks",
        "promises",
        "async/await",
        "loops",
      ],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which status code means success?",
      options: ["404", "500", "200", "301"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which database is commonly used with Node?",
      options: ["MongoDB", "Excel", "Firebase only", "SQLite only"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which method parses JSON body in Express?",
      options: [
        "express.body()",
        "express.json()",
        "app.body()",
        "body.parse()",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which package manages environment variables?",
      options: ["dotenv", "config", "env", "process"],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which object contains URL parameters?",
      options: [
        "req.params",
        "req.body",
        "req.query",
        "req.headers",
      ],
      answer: 0,
    ),
  ],
  categoryID: "3",
),
  Quiz(
    difficultyLevel: Level.hard,
  quizeName: "Advanced Node.js",
  questions: [
    QuizQuestion(
      question: "What is event loop in Node.js?",
      options: [
        "Animation system",
        "Handles asynchronous operations",
        "Database engine",
        "Routing system",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which module creates child processes?",
      options: ["cluster", "child_process", "worker", "fork"],
      answer: 1,
    ),
    QuizQuestion(
      question: "What is stream in Node.js?",
      options: [
        "Database",
        "Continuous data flow",
        "Routing method",
        "Middleware",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which method creates readable stream?",
      options: [
        "fs.createReadStream()",
        "fs.read()",
        "stream.read()",
        "createStream()",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which package secures passwords?",
      options: ["jsonwebtoken", "bcrypt", "cryptojs", "express"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which package creates JWT tokens?",
      options: ["bcrypt", "jsonwebtoken", "passport", "crypto"],
      answer: 1,
    ),
    QuizQuestion(
      question: "What is clustering in Node.js?",
      options: [
        "Database replication",
        "Running multiple Node instances",
        "Middleware chaining",
        "API grouping",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which method handles uncaught promise rejection?",
      options: [
        "process.on()",
        "catchError()",
        "rejectHandler()",
        "app.error()",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which architecture does Node.js follow?",
      options: [
        "Blocking I/O",
        "Event-driven non-blocking I/O",
        "Synchronous only",
        "Thread-per-request",
      ],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which package manager alternative is popular?",
      options: ["gulp", "webpack", "yarn", "babel"],
      answer: 2,
    ),
  ],
  categoryID: "3",
),
  Quiz(
    difficultyLevel: Level.medium,
  quizeName: "Node.js Rapid Fire",
  questions: [
    QuizQuestion(
      question: "Which command runs Node file?",
      options: ["npm app.js", "node app.js", "run app.js", "start app.js"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which object is global in Node.js?",
      options: ["window", "document", "global", "navigator"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which module handles operating system info?",
      options: ["path", "os", "http", "events"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which method installs package?",
      options: ["npm add", "npm install", "node install", "package install"],
      answer: 1,
    ),
    QuizQuestion(
      question: "Which method logs output?",
      options: ["print()", "echo()", "console.log()", "write()"],
      answer: 2,
    ),
    QuizQuestion(
      question: "Which object stores environment variables?",
      options: [
        "process.env",
        "env.process",
        "global.env",
        "node.env",
      ],
      answer: 0,
    ),
    QuizQuestion(
      question: "Which framework is lightweight for Node.js?",
      options: ["React", "Express", "Angular", "Flutter"],
      answer: 1,
    ),
  ],
  categoryID: "3",
),
  ];
  static String getCategoryName(String id){
    if(categories.containsKey(id)){
      return categories[id]!.name;
    }else{
      return 'undefined';
    }
    
  }
}

