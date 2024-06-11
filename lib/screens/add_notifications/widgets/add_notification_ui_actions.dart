part of '../add_notifications.dart';

class AddNotificationUIActions extends StatelessWidget {
  const AddNotificationUIActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationCubit, NotificationState>(
      listenWhen: (a, b) => a.addNotification != b.addNotification,
      child: const SizedBox.shrink(),
      listener: (_, state) {
        if (state.addNotification is AddNotificationLoading) {
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

        if (state.addNotification is AddNotificationFailed) {
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

        if (state.addNotification is AddNotificationSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          // Show the new snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Notification added Successfully'),
              duration: Duration(seconds: 4),
            ),
          );

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
    );
  }
}
