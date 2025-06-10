import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/dependency_injection.dart';
import 'package:flutter_application_1/doc_app.dart';
import 'package:flutter_application_1/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGitIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
