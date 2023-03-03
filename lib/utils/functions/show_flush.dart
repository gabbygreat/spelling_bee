import '../utils.dart';

Future showError(String error,
    {required BuildContext context, int duration = 1}) async {
  final flushBar = Flushbar(
    backgroundColor: Colors.red.withOpacity(0.8),
    borderColor: Colors.red,
    borderRadius: BorderRadius.circular(8.r),
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
    messageText: Text(
      error,
      style: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.w700,
      ),
    ),
    positionOffset: 12,
    duration: Duration(seconds: duration),
  );
  await flushBar.show(context);
}

Future showSuccess({
  String? message,
  required BuildContext context,
}) async {
  final flushBar = Flushbar(
    backgroundColor: Colors.green.withOpacity(0.8),
    borderColor: Colors.green,
    borderRadius: BorderRadius.circular(8.r),
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    messageText: Text(
      message ?? 'Successful',
      style: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.w700,
      ),
    ),
    positionOffset: 12,
    duration: const Duration(seconds: 1),
  );
  await flushBar.show(context);
}
