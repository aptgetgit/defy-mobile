import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BrowserStateModel {
  final TextEditingController urlController;
  final FocusNode urlFocusNode;
  String currentUrl;
  List<String> bookmarks;

  BrowserStateModel({
    required this.urlController,
    required this.urlFocusNode,
    required this.currentUrl,
    required this.bookmarks,
  });

  BrowserStateModel copyWith({
    TextEditingController? urlController,
    FocusNode? urlFocusNode,
    String? currentUrl,
    List<String>? bookmarks,
  }) {
    return BrowserStateModel(
      urlController: urlController ?? this.urlController,
      urlFocusNode: urlFocusNode ?? this.urlFocusNode,
      currentUrl: currentUrl ?? this.currentUrl,
      bookmarks: bookmarks ?? this.bookmarks,
    );
  }
}
