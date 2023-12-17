import 'package:api_base/presentation/utilities/app_utilities.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TextFieldControlElement {
  late final _stateKey = GlobalKey<FormFieldState>();

  var _focusNode = FocusNode();
  var _isHavingSpecialError = false;

  FocusNode get focusNode => _focusNode;
  GlobalKey<FormFieldState> get stateKey => _stateKey;
  bool get isHavingSpecialError => _isHavingSpecialError;

  // In case of not a text field (i.e: check box, ...),
  // call this function when validate and catch a empty error
  void setSpecialError(bool isHavingError) {
    _isHavingSpecialError = isHavingError;
  }

  // In case of show and hide text field,
  // must call this function before show the text field again
  void reviveFocusNode() {
    _focusNode = FocusNode();
  }

  void resetError() {
    _stateKey.currentState?.reset();
    _isHavingSpecialError = false;
  }
}

mixin BaseFormMixin<T extends StatefulWidget> on State<T> {
  final _formKey = GlobalKey<FormState>();
  final _columnKey = GlobalKey();
  final _scrollController = ScrollController();
  bool get allowScrollToInvalidField => true;

  GlobalKey get columnKey => _columnKey;
  ScrollController get scrollController => _scrollController;

  List<TextFieldControlElement> _controls = [];
  List<TextFieldControlElement> get controls => _controls;

  // must call in init state for the scroll to error function to work.
  void setupAutoScrollToErrorFields(List<TextFieldControlElement> controls) {
    setState(() {
      _controls = controls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () => AppUtilities.unFocus(),
        behavior: HitTestBehavior.translucent,
        child: buildFormContent(),
      ),
    );
  }

  Widget buildFormContent();

  void validate({
    required VoidCallback onSuccess,
    VoidCallback? onFailure,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          if (_formKey.currentState?.validate() == true) {
            AppUtilities.unFocus();
            onSuccess();
          } else {
            if (allowScrollToInvalidField) {
              scrollToInvalidField();
            }
            onFailure?.call();
          }
        });
      }
    });
  }

  void scrollToInvalidField() {
    final firstErrorField = _controls.firstWhereOrNull((element) =>
        element.isHavingSpecialError ||
        element.stateKey.currentState?.hasError == true);

    if (firstErrorField != null) {
      if (!_scrollController.hasClients) {
        FocusScope.of(context).requestFocus(firstErrorField.focusNode);
        return;
      }

      final phoneBox = firstErrorField.stateKey.currentContext
          ?.findRenderObject() as RenderBox?;
      final columnBox =
          _columnKey.currentContext?.findRenderObject() as RenderBox?;
      final position =
          phoneBox?.localToGlobal(Offset.zero, ancestor: columnBox);
      final y = position?.dy;

      final formBox = _formKey.currentContext?.findRenderObject() as RenderBox?;
      final formHeight = formBox?.size.height;

      if (y == null || formHeight == null) {
        return;
      }

      // this is the form

      ///////////////////////////////////     /|\
      // * _scrollController.offset    //      |
      //                               //      |
      //                               //      |
      //                               //      |
      //  * y (text field position)    //      |
      //   ____________                //      |
      //  |            |               //   formHeight
      //  |____________|               //      |
      //                               //      |
      //                               //      |
      //                               //      |
      //                               //      |
      //                               //      |
      //                               //      |
      ///////////////////////////////////     \|/

      // if y is between _scrollController.offset and _scrollController.offset + formHeight
      // do not scroll, only focus.

      final showingOnScreen = y > _scrollController.offset &&
          y < _scrollController.offset + formHeight;

      if (!showingOnScreen) {
        // add a little padding to top after scroll
        var position = y - 40;

        // if y is beyond maximum scroll extend, scroll to the end of the form

        if (position > _scrollController.position.maxScrollExtent) {
          position = _scrollController.position.maxScrollExtent;
        }

        _scrollController.animateTo(position,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }

      FocusScope.of(context).requestFocus(firstErrorField.focusNode);
    }
  }

  void resetErrorMessage() {
    setState(() {
      for (final element in controls) {
        element.resetError();
      }
    });
  }
}
