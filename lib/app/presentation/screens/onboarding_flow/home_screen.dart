import 'package:aquayar/app/bloc/user/user_bloc.dart';
import 'package:aquayar/app/bloc/user/user_state.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/home_logo_circle.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/outlined_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String? token;

  @override
  void initState() {
    final tokenBox = Hive.box("user_token_box");
    token = tokenBox.get("token");

    final UserBloc bloc = context.read<UserBloc>();
    bloc.add(UserEventGetUser(token: token));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserStateUserRetrieved) {
          Navigator.pushNamed(context, Routes.home, arguments: state.user);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserStateIsLoading) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 70,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SpinKitSpinningLines(
                      color: Color.fromARGB(255, 4, 136, 231),
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: 500,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                      ),
                    ),
                    const Logo()
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: TextWidget(
                      text: "Welcome to Aquayar 👋🏿",
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 40),
                  child: TextWidget(
                    fontSize: 15,
                    text: "Aquayar brings you closer to better water services",
                    color: Color(0xff868FAE),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.registration);
                    },
                    child: Image.asset("assets/images/button.png")),
                OutlinedBtn(
                  width: MediaQuery.of(context).size.width * .4,
                  label: const TextWidget(
                    text: "Login",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, Routes.login);
                    // final Position position = await UserProvider().getUserLocation();
                    // logger.e({position.latitude, position.longitude});
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
