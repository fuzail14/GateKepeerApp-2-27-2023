import 'package:gatekeeper/Module/Add%20Walkin%20Guests%20Deatil/View/add_walkin_guests_detail.dart';
import 'package:gatekeeper/Module/AddReportToAdmin/View/add_report_to_admin_screen.dart';
import 'package:gatekeeper/Module/Audio%20Call%20Screen/View/audio_call_screen.dart';
import 'package:gatekeeper/Module/Chat%20Screens/Neighbour%20Chat%20Screen/View/neighbour_chat_screen.dart';

import 'package:gatekeeper/Module/Login/View/login_screen.dart';
import 'package:gatekeeper/Module/Panic%20Mode/panic_mode_screen.dart';
import 'package:gatekeeper/Module/Pre%20Approve%20Entry%20Residents/View/pre_approve_entry_residents.dart';
import 'package:gatekeeper/Module/ReportToAdmin/View/report_to_admin_screen.dart';
import 'package:gatekeeper/Module/Service%20Provider%20Check%20In/View/service_provider_check_in.dart';
import 'package:gatekeeper/Module/Walkin%20Guests/View/walkin_guests.dart';
import 'package:gatekeeper/Routes/screen_binding.dart';
import 'package:get/get.dart';
import '../Module/Chat Availbility/View/chat_availbility_screen.dart';
import '../Module/Events/View/events_screen.dart';
import '../Module/GateKeeper Attendence/View/gate_keeper_attendence.dart';
import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/NoticeBoard/View/notice_board_screen.dart';
import '../Module/Pre Approve Entry Notifications/View/pre_approve_entry_notification.dart';
import '../Module/Pre Approved Guests/View/pre_approved_guests.dart';
import '../Module/Service Provider Check Out/View/service_provider_check_out.dart';
import '../Splash/View/splash_screen.dart';
import 'set_routes.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: splashscreen,
        page: () => SplashScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: loginscreen,
        page: () => Login(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: homescreen,
        page: () => HomeScreen(),
        binding: ScreenBindings(),
      ),
      // GetPage(
      //     name: chatscreen,
      //     page: () => ChatScreen(),
      //     binding: ScreenBindings(),
      //   ),
      GetPage(
        name: chatavailbilityscreen,
        page: () => ChatAvailbilityScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addreporttoadminscreen,
        page: () => AddReportToAdminScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: reporttoadminscreen,
        page: () => ReportToAdminScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: preApproveEntryNotificationonScreen,
        page: () => PreApproveEntryNotification(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: preApproveEntryResidents,
        page: () => PreApproveEntryResidents(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: preApprovedGuests,
        page: () => PreApprovedGuests(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: gateKeeperAttendance,
        page: () => GateKeeperAttendence(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: serviceProviderCheckIn,
        page: () => ServiceProviderCheckIn(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: serviceProviderCheckOut,
        page: () => ServiceProviderCheckOut(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: walkInGuests,
        page: () => WalkinGuests(),
        binding: ScreenBindings(),
      ),
      // GetPage(
      //   name: addWalkInGuestsDetail,
      //   //page: () => AddWalkinGuestsDetail(),
      //   binding: ScreenBindings(),
      // ),
      GetPage(
        name: panicMode,
        page: () => PanicModeScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: eventsscreen,
        page: () => EventsScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: noticeboardscreen,
        page: () => NoticeBoardScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: neighbourchatscreen,
        page: () => NeighbourChatScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: audiocallscreen,
        page: () => AudioCallScreen(),
        binding: ScreenBindings(),
      ),
      
    ];
  }
}
