import 'package:easy_transport_driver/cubits/auth/cubit.dart';
import 'package:easy_transport_driver/screens/full_screen_loader.dart';
import 'package:easy_transport_driver/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUIActions extends StatelessWidget {
  const LoginUIActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (a, b) => a.logIn != b.logIn,
      child: const SizedBox.shrink(),
      listener: (_, state) async {
        if (state.logIn is LogInLoading) {
          showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            isScrollControlled: true,
            elevation: 0,
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const FullScreenLoader(
                loading: true,
                blurFactor: 2.0,
                dropColor: Colors.transparent,
              );
            },
          );
        }

        if (state.logIn is LogInFailed) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          // Show the new snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Server Error'),
              duration: Duration(seconds: 4),
            ),
          );
        }

        if (state.logIn is LogInSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          // Show the new snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Successful"),
              duration: Duration(seconds: 4),
            ),
          );

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('userId', state.logIn!.data!);
        }
      },
    );
  }
}
