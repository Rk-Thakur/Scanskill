import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:online_learning_app/core/constants/color.dart';

import '../model/network_connection.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (GetIt.I.get<NetworkConnection>().isConnected) {
          GetIt.I.get<NetworkConnection>().isNavigated = false;
          Navigator.pop(context);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned(
              top: -60,
              left: -130,
              child: Hero(
                tag: "bg-tag",
                child: SvgPicture.asset(
                  "assets/scanskill.jpeg",
                  height: 320,
                  width: 264,
                  color: Color(0xffD8F5FF),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 16.h,
                ),
                Image.asset(
                  'assets/scanskill.jpeg',
                  height: 110.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Expanded(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_sharp,
                        size: 100,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Center(
                          child: Text("No internet connection!",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp))),
                      SizedBox(
                        height: 6.h,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (GetIt.I.get<NetworkConnection>().isConnected) {
                              GetIt.I.get<NetworkConnection>().isNavigated =
                                  false;
                              Navigator.pop(context);
                            }
                            // GoRouter.of(context).pop();
                          },
                          child: Text("Retry",
                              style: TextStyle(
                                  color: iconColor, fontSize: 16.sp))),
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
