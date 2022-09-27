import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/utils/app_color.dart';
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onsubmit,
  var onChange,
  var onTap,
  String? hintText,
  var prefixIconTapFunction,
   var validator,
  String? label,
   IconData? prefixIcon,
  var suffixIcon,
  bool isPassword = false,
  var sufixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      style: const TextStyle(
        color: Colors.black,
      ),

      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black
          ),
          labelStyle: const TextStyle(
              color: Colors.black
          ),

          suffixIcon: suffixIcon != null
              ? IconButton(
              onPressed: sufixPressed,
              icon: Icon(
                suffixIcon,
              ))
              : null,

          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,

              )
          ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,

            )


      ),
    )
    );
Widget defaultSearchField({
  required TextEditingController controller,
  required TextInputType type,
  var onsubmit,
  var onChange,
  var onTap,
  String? hintText,
  var prefixIconTapFunction,
  required var validator,
  String? label,
  required IconData prefixIcon,
  var suffixIcon,
  bool isPassword = false,
  var sufixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      style: const TextStyle(
        color: Colors.black,
      ),

      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black
          ),
          labelStyle: const TextStyle(
              color: Colors.black
          ),
          prefixIcon: InkWell(
            onTap: prefixIconTapFunction,
            child: Icon(
              prefixIcon,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
              onPressed: sufixPressed,
              icon: Icon(
                suffixIcon,
              ))
              : null,

          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.white24,

              )
          ),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.white,

              )
          )
      ),
    );

Widget myDivider()=>Padding(
  padding:const  EdgeInsets.all(10),
  child:Container(
    width: double.infinity,
    height: 2,
    color: Colors.grey[300],
  ) ,);


void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) =>widget

    )
);

Widget defaultButton({
  double width=double.infinity ,
  Color background = mainColor,
  required var function,
  required String text,
  var fontSize,
  bool isUpperCase = true,
  double radius = 10.0,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: mainColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

void showToast({
  required String text,
  required ToastStates state
})=>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color=Colors.grey;
      break;
    case ToastStates.ERROR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
  return color;
}