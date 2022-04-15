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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
          avatar: '',
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
    ),
  ];
}
