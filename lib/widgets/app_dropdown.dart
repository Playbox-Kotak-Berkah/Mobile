import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';
// import 'package:sizer/sizer.dart';

class AppDropdownItem {
  final String text;
  final int value;

  AppDropdownItem({
    required this.text,
    required this.value,
  });
}

class AppDropdown extends StatefulWidget {
  final String? label;
  final List<AppDropdownItem> items;
  final int value;
  final void Function(int?)? onChanged;
  final IconData? prefixIcon;
  final String? hintText;

  const AppDropdown({
    super.key,
    this.label,
    required this.items,
    required this.value,
    this.onChanged,
    this.prefixIcon,
    this.hintText,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
      // decoration: InputDecoration(
      //   constraints: BoxConstraints(maxWidth: 100.w),
      //   prefixIcon: widget.prefixIcon,
      //   suffixIcon: Icon(
      //     Icons.arrow_drop_down,
      //     size: 22,
      //   ),
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10),
      //     borderSide: BorderSide.none,
      //   ),
      //   isDense: true,
      //   contentPadding: EdgeInsets.symmetric(
      //     horizontal: 12,
      //     vertical: 12,
      //   ),
      //   filled: true,
      //   fillColor: Colors.white,
      //   hintText: widget.hintText,
      //   hintStyle: body5TextStyle(
      //     color: ColorConstants.slate[400],
      //   ),
      // ),
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
      onChanged: (e) {
        setState(() {
          if (e != null) {
            value = e;
          }
        });
        if (widget.onChanged != null) {
          widget.onChanged!(e);
        }
      },
      dropdownStyleData: DropdownStyleData(
        offset: Offset(0, -8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: widget.items
          .map(
            (e) => DropdownMenuItem(
              value: e.value,
              child: Text(
                e.text,
                style: body5TextStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
    );
  }
}
