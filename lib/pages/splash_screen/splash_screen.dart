import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/auth_bloc/auth_bloc.dart';
import 'dart:async';
import 'package:lettutor/pages/splash_screen/widgets/animation_widget.dart';
import 'package:lettutor/route_generator.dart';
import 'package:lettutor/utils/secured_local_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;
  late AuthBloc authBloc;
  late String? accessTokenLocalStorage;
  late String? refressTokenLocalStorage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);

    //animation controller
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    //rotation animation

    _rotationAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    //radius animation
    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    accessTokenLocalStorage =
        await SecuredLocalStorage().readString(KEY_CONST.ACCESS_TOKEN_KEY);

    refressTokenLocalStorage =
        await SecuredLocalStorage().readString(KEY_CONST.REFRESH_TOKEN_KEY);

    authBloc.add(
        CheckTokenEvent(accessTokenLocalStorage, refressTokenLocalStorage));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError || state is UnAuthenticated) {
          Navigator.pushReplacementNamed(context, RouteGenerator.loginRoute);
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, RouteGenerator.mainPageRoute);
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlue,
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimationWidget(
                    rotationValue: _rotationAnimation.value,
                    radiusValue: _radiusAnimation.value,
                    width: 255,
                    height: 255,
                    colorWidget: Colors.blue[900]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.2,
                    radiusValue: _radiusAnimation.value,
                    width: 200,
                    height: 200,
                    colorWidget: Colors.blue[800]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.4,
                    radiusValue: _radiusAnimation.value,
                    width: 175,
                    height: 175,
                    colorWidget: Colors.blue[700]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.6,
                    radiusValue: _radiusAnimation.value,
                    width: 150,
                    height: 150,
                    colorWidget: Colors.blue[600]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.6,
                    radiusValue: _radiusAnimation.value,
                    width: 125,
                    height: 125,
                    colorWidget: Colors.blue[500]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.6,
                    radiusValue: _radiusAnimation.value,
                    width: 100,
                    height: 100,
                    colorWidget: Colors.blue[400]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.6,
                    radiusValue: _radiusAnimation.value,
                    width: 75,
                    height: 75,
                    colorWidget: Colors.blue[300]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.6,
                    radiusValue: _radiusAnimation.value,
                    width: 50,
                    height: 50,
                    colorWidget: Colors.blue[200]),
                AnimationWidget(
                    rotationValue: _rotationAnimation.value + 0.6,
                    radiusValue: _radiusAnimation.value,
                    width: 25,
                    height: 25,
                    colorWidget: Colors.blue[100]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
