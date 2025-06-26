import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';
import 'package:salvest_app/business_logic/property%20for%20investment%20bloc/properties_for_investment_bloc.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';
import 'package:salvest_app/business_logic/user%20question%20bloc/user_questions_bloc.dart';
import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/data/services/auth%20services/auth_repo_impl.dart';
import 'package:salvest_app/data/services/help%20services/help_repo_impl.dart';
import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/firebase/flutter_notifications.dart';
import 'package:salvest_app/utility/app_bloc_observer.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/cash_helper.dart';
import 'package:salvest_app/utility/handle_cash.dart';
import 'package:salvest_app/utility/router.dart';
import 'package:salvest_app/utility/service_locator.dart';
import 'firebase_options.dart';

// إنشاء كائن إشعار واحد يمكن استخدامه في كل التطبيق
FlutterNotificationsClass flutterNotifications = FlutterNotificationsClass();

/// دالة لمعالجة الإشعارات في الخلفية
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling a background message: ${message.messageId}');
  flutterNotifications.flutterLocalNotificationsPlugin.show(
    message.data.hashCode,
    message.data['title'],
    message.data['body'],
    NotificationDetails(
      android: AndroidNotificationDetails(
        FlutterNotificationsClass.channel.id,
        FlutterNotificationsClass.channel.name,
        enableVibration: true,
        importance: Importance.high,
        priority: Priority.high,
      ),
    ),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // طلب صلاحيات الإشعار
  await FirebaseMessaging.instance.requestPermission();

  // تعيين معالج الإشعارات في الخلفية
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // إنشاء قناة إشعار لأندرويد 8.0+
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // يجب أن يتطابق مع ما في AndroidNotificationDetails
    'High Importance Notifications',
    description: 'هذه القناة للإشعارات المهمة',
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  // حفظ التوكن لاستخدامه في إرسال الإشعارات
  String? token = await FirebaseMessaging.instance.getToken();
  print('Firebase Messaging Token: $token');

  // إعداد Stripe
  Stripe.publishableKey =
      'pk_test_51RBxRR2MvyyhT4mR13N5Ucs99rBbvzc4ER9MC1yNlV7xtfNcodqYALDmiGa5bBsKyczBWS06A0bP7ojpvxLdFooB00lRnfBNrT';
  await Stripe.instance.applySettings();

  // باقي التهيئة
  await CacheHelper.init();
  await getCache();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  // بدء التطبيق
  runApp(const SalvestApp());
  configLoading();
}

/// إعداد واجهة التحميل
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..animationStyle = EasyLoadingAnimationStyle.offset
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.lightPurple
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.lightPurple
    ..textColor = AppColors.lightPurple
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

/// التطبيق الأساسي
class SalvestApp extends StatefulWidget {
  const SalvestApp({super.key});

  @override
  State<SalvestApp> createState() => _SalvestAppState();
}

class _SalvestAppState extends State<SalvestApp> {
  @override
  void initState() {
    super.initState();

    // تهيئة الإشعارات المحلية في الواجهة
    flutterNotifications = FlutterNotificationsClass();
    flutterNotifications.localNotificationsRequestPermission();
    flutterNotifications.handleForeGroundNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(getIt.get<AuthRepoImpl>())),
        BlocProvider(create: (context) => HelpBloc(getIt.get<HelpRepoImpl>())),
        BlocProvider(create: (context) => SalePropertyBloc()),
        BlocProvider(
          create:
              (context) => LargestRewardBloc(getIt.get<LargestRewardRepoImpl>()),
        ),
          BlocProvider(
          create:
              (context) => SendPropertyBloc(getIt.get<SalePropertyRepoImpl>()),
        ),
        

        BlocProvider(
          create: (context) => WalletBloc(getIt.get<WalletServicesRepoImpl>()),
        ),
        BlocProvider(
          create:
              (context) => PropertiesForInvestmentBloc(
                getIt.get<SalePropertyRepoImpl>(),
              ),
        ),
        BlocProvider(
          create: (context) => UserQuestionsBloc(getIt.get<HelpRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
