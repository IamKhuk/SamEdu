import 'package:samedu/src/model/lesson_model.dart';
import 'package:samedu/src/model/news_model.dart';
import 'package:samedu/src/model/schedule_model.dart';
import 'package:samedu/src/model/teacher_model.dart';

class Defaults {
  List<List<ScheduleModel>> schedules = [
    [
      ScheduleModel(
        subject: 'Maths Analyses',
        weekDay: 'Monday',
        start: '13:00',
        end: '14:20',
        room: 'P1',
        teacher: TeacherModel(
          fullName: 'Jo\'raqulov Abdulla',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Maths Analyses',
        weekDay: 'Monday',
        start: '14:30',
        end: '15:50',
        room: 'P1',
        teacher: TeacherModel(
          fullName: 'Kuliyev Komil',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'English',
        weekDay: 'Monday',
        start: '16:00',
        end: '17:20',
        room: '509',
        teacher: TeacherModel(
          fullName: 'Christopher',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
    ],
    [
      ScheduleModel(
        subject: 'Advanced Programming Practice',
        weekDay: 'Tuesday',
        start: '13:00',
        end: '14:20',
        room: '509',
        teacher: TeacherModel(
          fullName: 'Christo Ananth',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Advanced Programming Practice',
        weekDay: 'Tuesday',
        start: '14:30',
        end: '15:50',
        room: '509',
        teacher: TeacherModel(
          fullName: 'Christo Ananth',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Advanced Programming Practice',
        weekDay: 'Tuesday',
        start: '16:00',
        end: '17:20',
        room: '509',
        teacher: TeacherModel(
          fullName: 'Kenjayev Sanjar',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
    ],
    [
      ScheduleModel(
        subject: 'Discrete Maths',
        weekDay: 'Wednesday',
        start: '13:00',
        end: '14:20',
        room: 'P1',
        teacher: TeacherModel(
          fullName: 'Shodiyev Usmon',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Maths Analyses',
        weekDay: 'Wednesday',
        start: '14:30',
        end: '15:50',
        room: 'P1',
        teacher: TeacherModel(
          fullName: 'Kuliyev Komil',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Data Structure',
        weekDay: 'Wednesday',
        start: '16:00',
        end: '17:20',
        room: '509',
        teacher: TeacherModel(
          fullName: 'Parmonov Bekhruz',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
    ],
    [
      ScheduleModel(
        subject: 'Maths Analyses',
        weekDay: 'Thursday',
        start: '13:00',
        end: '14:20',
        room: '310',
        teacher: TeacherModel(
          fullName: 'Kenjayev Sanjar',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Data Structure',
        weekDay: 'Thursday',
        start: '14:30',
        end: '15:50',
        room: 'P1',
        teacher: TeacherModel(
          fullName: 'Christo Ananth',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Information',
        weekDay: 'Thursday',
        start: '16:00',
        end: '17:20',
        room: '509',
        teacher: TeacherModel(
          fullName: 'Nurmamatov Bahrom',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
    ],
    [
      ScheduleModel(
        subject: 'Independent lesson',
        weekDay: 'Friday',
        start: '13:00',
        end: '14:20',
        room: '509',
        teacher: TeacherModel(
          fullName: '',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Independent lesson',
        weekDay: 'Friday',
        start: '14:30',
        end: '15:50',
        room: '509',
        teacher: TeacherModel(
          fullName: '',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Independent lesson',
        weekDay: 'Friday',
        start: '16:00',
        end: '17:20',
        room: '509',
        teacher: TeacherModel(
          fullName: '',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
    ],
    [
      ScheduleModel(
        subject: 'Object Oriented Programming',
        weekDay: 'Saturday',
        start: '13:00',
        end: '14:20',
        room: '509',
        teacher: TeacherModel(
          fullName: 'Christo Ananth',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
      ScheduleModel(
        subject: 'Object Oriented Programming',
        weekDay: 'Saturday',
        start: '14:30',
        end: '15:50',
        room: 'P1',
        teacher: TeacherModel(
          fullName: 'Christo Ananth',
          avatar: 'assets/images/teacher_01.jpg',
        ),
      ),
    ],
  ];

  List<NewsModel> news = [
    NewsModel(
      title: 'Ishlash istagingiz bormi? Bu aynan siz uchun',
      images: [
        'assets/images/news_01.jpg',
        'assets/images/news_02.jpg',
        'assets/images/news_03.jpg',
      ],
      text:
          'Шароф Рашидов номидаги Самарқанд давлат университети бош биносида талабаларни иш билан таъминлаш мақсадида “Карьера куни - меҳнат ярмаркаси” ўтказилиши кутилмоқда. Тадбирда вилоят Бандлик бош бошқармаси ҳамда юздан ортиқ корхона ва ташкилотларнинг вакиллари бўш иш ўринларини таклиф қилади.',
      date: DateTime(2022, 04, 14, 9, 1),
      likes: 15,
      dislikes: 2,
    ),
    NewsModel(
      title:
          'Dasturlashni o\'rganmoqchi bo\'lgan yoshlar uchun imkoniyatlar eshigi',
      images: [
        'assets/images/news_05.jpg',
        'assets/images/news_06.jpg',
      ],
      text:
          'Инновацион ривожланиш вазирлигининг Самарқанд давлат университетида жойлашган Самарқанд вилояти Ёшлар технопаркининг очилиш маросимига Ўзбекистон Республикаси Инновацион ривожланиш вазири Иброҳим Абдураҳмонов, Самарқанд вилояти ҳокими Эркинжон Турдимов, Самарқанд давлат университети ректори, профессор, Олий Мажлис Сенати аъзоси Рустам Холмуродов ташриф буюрди.',
      date: DateTime(2022, 04, 14, 9, 1),
      likes: 12,
      dislikes: 3,
    ),
  ];

  List<LessonModel> lessons = [
    LessonModel(
      name: 'Object Oriented Programming',
      teacher: TeacherModel(
        fullName: 'Christo Ananth',
        avatar: 'assets/images/teacher_01.jpg',
      ),
    ),
    LessonModel(
      name: 'Data Structure',
      teacher: TeacherModel(
        fullName: 'Christo Ananth',
        avatar: 'assets/images/teacher_01.jpg',
      ),
    ),
    LessonModel(
      name: 'Maths Analyses',
      teacher: TeacherModel(
        fullName: 'Komil Kuliyev',
        avatar: 'assets/images/teacher_01.jpg',
      ),
    ),
    LessonModel(
      name: 'Advanced Programming Practice',
      teacher: TeacherModel(
        fullName: 'Kenjayev Sanjar',
        avatar: 'assets/images/teacher_01.jpg',
      ),
    ),
    LessonModel(
      name: 'English',
      teacher: TeacherModel(
        fullName: 'Christopher',
        avatar: 'assets/images/teacher_01.jpg',
      ),
    ),
    LessonModel(
      name: 'Discrete Maths',
      teacher: TeacherModel(
        fullName: 'Shodiyev Usmon',
        avatar: 'assets/images/teacher_01.jpg',
      ),
    ),
  ];

  List<TeacherModel> teachers = [
    TeacherModel(
      fullName: 'Christo Ananth',
      avatar: 'assets/images/teacher_01.jpg',
    ),
    TeacherModel(
      fullName: 'Shodiyev Usmon',
      avatar: 'assets/images/teacher_01.jpg',
    ),
    TeacherModel(
      fullName: 'Christopher',
      avatar: 'assets/images/teacher_01.jpg',
    ),
    TeacherModel(
      fullName: 'Kenjayev Sanjar',
      avatar: 'assets/images/teacher_01.jpg',
    ),
    TeacherModel(
      fullName: 'Komil Kuliyev',
      avatar: 'assets/images/teacher_01.jpg',
    ),
    TeacherModel(
      fullName: 'Parmonov Bekhruz',
      avatar: 'assets/images/teacher_01.jpg',
    ),
  ];
}
