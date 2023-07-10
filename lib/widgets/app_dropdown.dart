import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';
// import 'package:sizer/sizer.dart';

class AppDropdownItem {
  final String text;
  final int value;
  final Widget? child;
  final bool enabled;

  AppDropdownItem({
    required this.text,
    required this.value,
    this.child,
    this.enabled = true,
  });
}

class AppDropdown extends StatefulWidget {
  final String? label;
  final List<AppDropdownItem> items;
  final int value;
  final void Function(int?)? onChanged;
  final IconData? prefixIcon;
  final String? hintText;
  final bool isDisabled;

  const AppDropdown({
    super.key,
    this.label,
    required this.items,
    required this.value,
    this.onChanged,
    this.prefixIcon,
    this.hintText,
    this.isDisabled = false,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  int? value;
  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      key: _key,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      isExpanded: true,
      isDense: true,
      iconStyleData: IconStyleData(
        iconSize: 1,
      ),
      customButton: Container(
        width: 100.w,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.isDisabled ? ColorConstants.slate[200] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.isDisabled
                ? ColorConstants.slate[300]!
                : ColorConstants.slate[200]!,
          ),
        ),
        child: Row(
          children: [
            widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: 18,
                    color: ColorConstants.slate[600],
                  )
                : Container(),
            SizedBox(width: 10),
            Expanded(
              child: Builder(
                builder: (context) {
                  var isValid = true;
                  if (value == null) {
                    isValid = false;
                  }
                  if (value == -1) {
                    isValid = false;
                  }
                  if (widget.items
                          .indexWhere((element) => element.value == value) ==
                      -1) {
                    isValid = false;
                  }

                  return Text(
                    isValid
                        ? widget.items
                            .firstWhere((element) => element.value == value)
                            .text
                        : widget.hintText ?? "",
                    style: body5TextStyle(
                      weight: isValid ? FontWeight.w500 : FontWeight.normal,
                      color: isValid
                          ? ColorConstants.slate[800]
                          : ColorConstants.slate[500],
                    ),
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: ColorConstants.slate[600],
            ),
          ],
        ),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
      ),
      hint: widget.hintText != null
          ? SizedBox(
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.hintText!,
                    style: body5TextStyle(
                      color: ColorConstants.slate[400],
                    ),
                  ),
                ],
              ),
            )
          : null,
      onChanged: !widget.isDisabled
          ? (int? e) {
              setState(() {
                if (e != null) {
                  value = e;
                }
              });
              if (widget.onChanged != null) {
                widget.onChanged!(e);
              }
            }
          : null,
      dropdownStyleData: DropdownStyleData(
        offset: Offset(0, -8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: widget.items.isNotEmpty
          ? widget.items
              .map(
                (e) => DropdownMenuItem(
                  value: e.value,
                  onTap: null,
                  enabled: e.enabled,
                  child: e.child ??
                      Text(
                        e.text,
                        style: body5TextStyle(),
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              )
              .toList()
          : [
              DropdownMenuItem<int>(
                value: 1,
                enabled: false,
                child: Row(
                  children: [
                    Text(
                      "Tidak ada data",
                      style: body5TextStyle(),
                    ),
                  ],
                ),
              ),
            ],
    );
  }
}
