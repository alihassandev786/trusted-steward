import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/fhomesection/fstewardscore.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/fprofilesection/addfamilymember.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/fprofilesection/familymember.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/fprofilesection/fpermission.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/ftreasuresection/expences.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/ftreasuresection/giving.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/ftreasuresection/income.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/ftreasuresection/savings.dart';

import '../../presentation/coupleside/bottomnavigationsection/bottomnavigation.dart';
import '../../presentation/coupleside/bottomnavigationsection/homesection/homescreen.dart';
import '../../presentation/coupleside/bottomnavigationsection/homesection/steward_score.dart';
import '../../presentation/coupleside/bottomnavigationsection/learnsection/completecourse.dart';
import '../../presentation/coupleside/bottomnavigationsection/learnsection/coursedetail.dart';
import '../../presentation/coupleside/bottomnavigationsection/learnsection/learn.dart';
import '../../presentation/coupleside/bottomnavigationsection/learnsection/quizquestiononboarding.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/editprofile.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/helpandsupport.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/notification.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/priavcyandsecuritysection/Updatepassword.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/priavcyandsecuritysection/privacy_security.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/priavcyandsecuritysection/privacypolicy.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/priavcyandsecuritysection/termsandcondition.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/profile.dart';
import '../../presentation/coupleside/bottomnavigationsection/profilesection/rateapp.dart';
import '../../presentation/coupleside/bottomnavigationsection/time.dart';
import '../../presentation/coupleside/bottomnavigationsection/treasuresection/sharedbudget.dart';
import '../../presentation/coupleside/bottomnavigationsection/treasuresection/sharedgoals.dart';
import '../../presentation/coupleside/bottomnavigationsection/treasuresection/treasure.dart';
import '../../presentation/coupleside/otherscreens/couplesetup.dart';
import '../../presentation/familyside/fbottomnavigationsection/fbottomnavigation.dart';
import '../../presentation/familyside/fotherscreens/familysetup.dart';


class AppRoutes {
  AppRoutes._();

  static const String couplesetup = '/';
  static const String bottomnavigation = '/bottomnavigation';
  static const String home = '/home';
  static const String learn = '/learn';
  static const String time = '/time';
  static const String treasure = '/treasure';
  static const String profile = '/profile';
  static const String editprofile = '/editprofile';
  static const String helpandsupport = '/helpandsupport';
  static const String notification = '/notification';
  static const String rateapp = '/rateapp';
  static const String sharedgoal = '/sharedgoal';
  static const String sharedbudget = '/sharedbudget';
  static const String updatepassword = '/updatepassword';
  static const String termsandconsition = '/termsandconsition';
  static const String privacypolicy = '/privacypolicy';
  static const String privacysecurity = '/privacysecurity';
  static const String coursedetail = '/coursedetail';
  static const String completecourse = '/completecourse';
  static const String quizquestiononboarding = '/quizquestiononboarding';
  static const String stewardscore = '/stewardscore';
  // family section

  static const String familysetup = '/familysetup';
  static const String fbottomnavigation = '/fbottomnavigation';
  static const String fstewardscore = '/fstewardscore';
  static const String fpermission = '/fpermission';
  static const String familymember = '/familymember';
  static const String expences = '/expences';
  static const String income = '/income';
  static const String saving = '/saving';
  static const String giving = '/giving';
  static const String addfamilymember = '/addfamilymember';













  static final List<GetPage> pages = [
    GetPage(
      name: couplesetup,
      page: () => const Couplesetup(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: bottomnavigation,
      page: () => const Bottomnavigation(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: home,
      page: () => const Homescreen(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: learn,
      page: () => const Learn(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: time,
      page: () => const Time(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: treasure,
      page: () => const Treasure(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: profile,
      page: () => const Profile(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: editprofile,
      page: () => const Editprofile(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: helpandsupport,
      page: () => const Helpandsupport(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const Notification(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: rateapp,
      page: () => const Rateapp(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: privacysecurity,
      page: () => const PrivacySecurity(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: privacypolicy,
      page: () => const Privacypolicy(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: termsandconsition,
      page: () => const Termsandcondition(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: updatepassword,
      page: () => const Updatepassword(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: sharedbudget,
      page: () => const Sharedbudget(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: sharedgoal,
      page: () => const Sharedgoals(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: coursedetail,
      page: () => const Coursedetail(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: completecourse,
      page: () => const Completecourse(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: quizquestiononboarding,
      page: () => const Quizquestiononboarding(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: stewardscore,
      page: () => const StewardScore(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),

    // family section

    GetPage(
      name: familysetup,
      page: () => const Familysetup(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: fbottomnavigation,
      page: () => const Fbottomnavigation(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: fstewardscore,
      page: () => const Fstewardscore(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: fpermission,
      page: () => const Fpermission(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: familymember,
      page: () => const Familymember(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: expences,
      page: () => const Expenses(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: income,
      page: () => const Income(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: saving,
      page: () => const Savings(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: giving,
      page: () => const Giving(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: addfamilymember,
      page: () => const Addfamilymember(),
      transition: Transition.rightToLeft,
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
    ),

  ];
}
