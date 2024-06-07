import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wothcompanion/interface/interface.dart';

class Utils {
  static Color backgroundAt(int index) => index % 2 == 0 ? Interface.odd : Interface.even;

  static String removePointZero(double value) {
    String text = value.toString();
    List<String> split = text.split(".");
    return (split.length == 2 && split[1] == "0") ? split[0] : text;
  }

  static void redirectTo(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Unfortunately the link could not be launched. Please, go back or restart the application.");
    }
  }

  static void mailTo() async {
    if (!await launchUrl(Uri(scheme: 'mailto', path: 'toastovac@email.cz'), mode: LaunchMode.externalApplication)) {
      throw Exception("Unfortunately the link could not be launched. Please, go back or restart the application.");
    }
  }

  static Future<String> readFile(String name) async {
    try {
      final file = await _localFile(name);
      final String contents;
      await file.exists() ? contents = await file.readAsString() : contents = "[]";
      return contents;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<File> writeFile(String content, String name) async {
    final file = await _localFile(name);
    return file.writeAsString(content);
  }

  static Future<File> _localFile(String name) async {
    final path = await _localPath;
    return File("$path/$name.json");
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
