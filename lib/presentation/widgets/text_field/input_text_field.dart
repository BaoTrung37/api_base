import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    this.textInputAction = TextInputAction.done,
    this.description,
    this.onTextChange,
    this.focusNode,
    this.onEditingComplete,
    this.initialText,
    this.controller,
    this.placeholder,
    this.hintMaxLines,
    this.textStyle,
    this.placeholderTextStyle,
    this.minLine,
    this.maxLength,
    this.maxLine,
    this.keyboardType,
    this.onFocusChange,
    this.shouldShowErrorMessage = true,
    this.shouldShowIconClear = false,
    this.minHeight,
    this.enableSuggestions = true,
    this.autoCorrect = true,
    this.isPassword = false,
    this.textFieldKey,
    this.validator,
    this.inputFormatters,
    this.backgroundColor,
    this.iconColor,
    this.obscuringCharacter,
    this.contentPadding,
    this.isDense = false,
    this.height,
    this.isActive = true,
    this.isAutoDisposeController = true,
    this.isAutoValidateWhenOutFocus = true,
    this.onSubmit,
    this.onTap,
    this.canInteract = true,
    this.prefixIcon,
    super.key,
  });

  const InputTextField.singleLine({
    this.onTextChange,
    this.description,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.onEditingComplete,
    this.initialText,
    this.controller,
    this.placeholder,
    this.hintMaxLines,
    this.textStyle,
    this.maxLength,
    this.placeholderTextStyle,
    this.keyboardType,
    this.onFocusChange,
    this.shouldShowErrorMessage = true,
    this.shouldShowIconClear = false,
    this.enableSuggestions = true,
    this.autoCorrect = true,
    this.isPassword = false,
    this.textFieldKey,
    this.validator,
    this.inputFormatters,
    this.backgroundColor,
    this.iconColor,
    this.obscuringCharacter,
    this.contentPadding,
    this.isDense = true,
    this.height,
    this.isActive = true,
    this.isAutoDisposeController = true,
    this.isAutoValidateWhenOutFocus = true,
    this.onSubmit,
    this.onTap,
    this.canInteract = true,
    this.prefixIcon,
    super.key,
  })  : minHeight = null,
        minLine = 1,
        maxLine = 1;

  const InputTextField.expandable({
    this.onTextChange,
    this.description,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.onEditingComplete,
    this.initialText,
    this.controller,
    this.placeholder,
    this.hintMaxLines,
    this.textStyle,
    this.minLine,
    this.maxLength,
    this.placeholderTextStyle,
    this.onFocusChange,
    this.shouldShowErrorMessage = true,
    this.shouldShowIconClear = false,
    this.minHeight,
    this.enableSuggestions = true,
    this.autoCorrect = true,
    this.isPassword = false,
    this.textFieldKey,
    this.validator,
    this.inputFormatters,
    this.backgroundColor,
    this.iconColor,
    this.obscuringCharacter,
    this.contentPadding,
    this.isDense = false,
    this.height,
    this.isActive = true,
    this.isAutoDisposeController = true,
    this.isAutoValidateWhenOutFocus = true,
    this.onSubmit,
    this.onTap,
    this.canInteract = true,
    this.prefixIcon,
    super.key,
  })  : keyboardType = TextInputType.multiline,
        maxLine = null;

  final String? initialText;
  final String? description;
  final VoidCallback? onEditingComplete;
  final GlobalKey<FormFieldState>? textFieldKey;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? placeholder;
  final int? hintMaxLines;
  final TextStyle? textStyle;
  final TextStyle? placeholderTextStyle;
  final ValueChanged<String?>? onTextChange;
  final ValueChanged<String?>? onSubmit;
  final ValueChanged<bool>? onFocusChange;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? obscuringCharacter;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final double? minHeight;
  final double? height;
  final EdgeInsets? contentPadding;
  final VoidCallback? onTap;
  final bool? canInteract;

  final bool shouldShowErrorMessage;
  final bool shouldShowIconClear;
  final bool enableSuggestions;
  final bool autoCorrect;
  final bool isPassword;

  final bool isAutoDisposeController;
  final bool isAutoValidateWhenOutFocus;

  final bool isActive;
  final bool? isDense;

  final Color? backgroundColor;
  final Color? iconColor;

  final Icon? prefixIcon;

  @override
  State<InputTextField> createState() => _TextBoxState();
}

class _TextBoxState extends State<InputTextField> {
  late final TextEditingController _textController;
  late final GlobalKey<FormFieldState> _textFieldKey;
  late final FocusNode _focusNode;

  bool _obscureText = false;
  var _isTextEmpty = true;
  var _currentTextLength = 0;
  var _isFocus = false;

  // Use this to hide default error message for InputTextField
  final TextStyle _hiddenTextStyle = const TextStyle(
    height: 0.01,
    color: Colors.transparent,
  );

  @override
  void initState() {
    super.initState();
    _textController =
        widget.controller ?? TextEditingController(text: widget.initialText);
    if (widget.isPassword) {
      _obscureText = true;
    }
    _isTextEmpty = _textController.text.isEmpty;
    _textFieldKey = widget.textFieldKey ?? GlobalKey<FormFieldState>();
    _focusNode = widget.focusNode ?? FocusNode();
    _currentTextLength = _textController.text.length;

    _textController.addListener(() {
      if (mounted) {
        setState(() {
          _currentTextLength = _textController.text.length;
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.isAutoDisposeController) {
      _textController.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  String? get _errorMessage {
    return _textFieldKey.currentState?.errorText;
  }

  Border? get getBorder {
    if (_errorMessage != null) {
      return Border.all(color: context.colors.error, width: 1);
    }
    if (_isFocus) {
      return Border.all(color: context.colors.primaryMain, width: 1);
    }
    return null;
  }

  Color? get getBackgroundColor {
    if (_isFocus) {
      return context.colors.primaryBackground;
    }
    return widget.backgroundColor ?? context.colors.action;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isActive ? 1 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: widget.height ?? 60.h,
            alignment: widget.minHeight == null ? null : Alignment.topLeft,
            constraints: widget.minHeight == null
                ? null
                : BoxConstraints(minHeight: widget.minHeight!),
            decoration: BoxDecoration(
              color: getBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: getBorder,
            ),
            child: Row(
              children: [
                Flexible(
                  child: Focus(
                    onFocusChange: (focus) {
                      widget.onFocusChange?.call(focus);
                      setState(() {
                        _isFocus = focus;
                      });
                      if (!focus && widget.isAutoValidateWhenOutFocus) {
                        setState(() {
                          _textController.text = _textController.text.trim();
                          widget.onTextChange?.call(_textController.text);
                          _textFieldKey.currentState?.validate();
                        });
                      }
                    },
                    child: TextFormField(
                      key: _textFieldKey,
                      enabled: widget.isActive,
                      enableInteractiveSelection: widget.canInteract,
                      onEditingComplete: widget.onEditingComplete,
                      onFieldSubmitted: widget.onSubmit,
                      onChanged: (value) {
                        setState(() {
                          _isTextEmpty = value.isEmpty;
                        });
                        widget.onTextChange?.call(value);
                      },
                      obscureText: _obscureText,
                      obscuringCharacter: widget.obscuringCharacter ??
                          AppConstant.obscuringCharacter,
                      enableSuggestions: widget.enableSuggestions,
                      autocorrect: widget.autoCorrect,
                      validator: widget.validator,
                      inputFormatters: widget.inputFormatters,
                      readOnly: false,
                      keyboardType: widget.keyboardType,
                      minLines: widget.minLine,
                      maxLines: widget.maxLine,
                      controller: _textController,
                      focusNode: _focusNode,
                      textInputAction: widget.textInputAction,
                      style: widget.textStyle ??
                          AppTextStyles.textMedium.copyWith(
                            color: context.colors.textPrimary,
                          ),
                      cursorColor: context.colors.primaryMain,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.placeholder,
                        hintStyle: widget.placeholderTextStyle ??
                            AppTextStyles.textMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                        isDense: widget.isDense,
                        hintMaxLines: widget.hintMaxLines,
                        errorStyle: _hiddenTextStyle,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding: widget.contentPadding ??
                            EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 12.w,
                            ),
                        prefixIcon: widget.prefixIcon,
                        prefixIconColor: _isFocus
                            ? context.colors.contentSpecialMain
                            : context.colors.backdropPrimary,
                      ),
                      onTap: widget.onTap,
                    ),
                  ),
                ),
                if (widget.shouldShowIconClear) _buildClearIconView(context),
                if (widget.isPassword) _buildPasswordToggleView(context),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.shouldShowErrorMessage && _errorMessage != null)
                Expanded(
                  child: _buildErrorText(
                    context,
                    error: _errorMessage!,
                  ),
                ),
              if (widget.description != null && _errorMessage == null)
                Expanded(
                  child: _buildDescriptionText(context,
                      description: widget.description!),
                ),
              if (widget.maxLength != null) _buildCounterTextView(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildErrorText(
    BuildContext context, {
    required String error,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Text(
        error,
        style: AppTextStyles.textSmall.copyWith(color: context.colors.error),
      ),
    );
  }

  Widget _buildDescriptionText(
    BuildContext context, {
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Text(
        description,
        style: AppTextStyles.textSmall.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildCounterTextView(BuildContext context) {
    if (widget.maxLength == null) {
      return Container();
    }
    return Text(
      '$_currentTextLength/${widget.maxLength}',
      style: AppTextStyles.textSmall.copyWith(
        color: _currentTextLength > widget.maxLength!
            ? context.colors.error
            : context.colors.textSecondary,
      ),
      textAlign: TextAlign.right,
    );
  }

  Widget _buildClearIconView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: _isTextEmpty
            ? null
            : () {
                setState(() {
                  _textController.clear();
                  _currentTextLength = 0;
                });
                _textFieldKey.currentState?.validate();
                widget.onTextChange?.call('');
              },
        child: Icon(
          Icons.cancel,
          color: context.colors.iconSecondary,
        ),
      ),
    );
  }

  Widget _buildPasswordToggleView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 12.w,
      ),
      child: GestureDetector(
        child: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: _isFocus
              ? context.colors.contentSpecialMain
              : (widget.iconColor ?? context.colors.iconPrimary),
          size: 22.sp,
        ),
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
