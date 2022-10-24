import 'package:flutter/material.dart';

class ApplicationTheme {
  /**
   ####################### Application dark theme property ##############################
   */
  static ThemeData applicationDarkTheme = ThemeData.dark().copyWith(
      /**
     * -------------------- Scaffold Background Color -----------------------
     */
      scaffoldBackgroundColor: Colors.black,
/**
 * -------------------------- Primary Color --------------------------
 */
      primaryColor: Colors.green,
      /**
  * -------------------------- AppBar Theme --------------------------
  */
      appBarTheme: AppBarTheme(backgroundColor: Colors.green),
      /***
     * -------------------------- Prrmary Text Theme --------------------------
     */
      primaryTextTheme: const TextTheme(
        button: TextStyle(color: Colors.white, fontSize: 18),
        headline1: TextStyle(color: Colors.white, fontSize: 72),
        headline2: TextStyle(color: Colors.white, fontSize: 56),
        headline3: TextStyle(color: Colors.white, fontSize: 48),
        headline4: TextStyle(color: Colors.white, fontSize: 32),
        headline5: TextStyle(color: Colors.white, fontSize: 24),
        headline6: TextStyle(color: Colors.white, fontSize: 16),
        bodyText2: TextStyle(color: Colors.white, fontSize: 16),
        subtitle1: TextStyle(color: Colors.white, fontSize: 16),
      ),
      /**
     * ----------------------------- Drawer Theme -------------------------
     */
      drawerTheme: DrawerThemeData(backgroundColor: Colors.black),
      /**
     * -------------------------- Button Theme --------------------------
     */
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.white,
        textTheme: ButtonTextTheme.primary,
      ),
      /***
     * ************************************************************************
     * **************************  Buttons Section ****************************
     * ************************************************************************
     */
      /**
     *  -------------------------- 1 - OutlinedButton --------------------------
     */
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Colors.green,
          side: BorderSide(color: Colors.green, width: 2),
        ),
      ),
      /**
     *  2 - ElevatedButton
     */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      /**
   *  3 - Text Button
   */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
/**
 * 4- Floating action button
 */
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        iconSize: 18,
      ),
      /**
     *************************************************************************
     ***************************  TextField Section **************************
     *************************************************************************
     * */
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.green,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.green)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      /**
               * *************************** Cursor Color **********************************
               */
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.green),
      /**
           * ************************* TF prefix - postfix themeing **********************
           */
      iconTheme: IconThemeData(color: Colors.green));

  /**
   * ############################# Application light theme property ###########################
   */

  static ThemeData applicationLightTheme = ThemeData.light().copyWith(
      /**
     * -------------------- Scaffold Background Color -----------------------
     */
      scaffoldBackgroundColor: Colors.white,
/**
 * -------------------------- Primary Color --------------------------
 */
      primaryColor: Colors.green,
      /**
  * -------------------------- AppBar Theme --------------------------
  */
      appBarTheme: AppBarTheme(backgroundColor: Colors.green),
      /***
     * -------------------------- Prrmary Text Theme --------------------------
     */
      primaryTextTheme: const TextTheme(
        button: TextStyle(color: Colors.black, fontSize: 18),
        headline1: TextStyle(color: Colors.black, fontSize: 72),
        headline2: TextStyle(color: Colors.black, fontSize: 56),
        headline3: TextStyle(color: Colors.black, fontSize: 48),
        headline4: TextStyle(color: Colors.black, fontSize: 32),
        headline5: TextStyle(color: Colors.black, fontSize: 24),
        headline6: TextStyle(color: Colors.black, fontSize: 16),
        bodyText2: TextStyle(color: Colors.black, fontSize: 16),
        subtitle1: TextStyle(color: Colors.black, fontSize: 16),
      ),
      /**
     * ----------------------------- Drawer Theme -------------------------
     */
      drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
      /**
     * -------------------------- Button Theme --------------------------
     */
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
      ),
      /***
     * ************************************************************************
     * **************************  Buttons Section ****************************
     * ************************************************************************
     */
      /**
     *  -------------------------- 1 - OutlinedButton --------------------------
     */
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          primary: Colors.green,
          side: BorderSide(color: Colors.green, width: 2),
        ),
      ),
      /**
     *  2 - ElevatedButton
     */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      /**
   *  3 - Text Button
   */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
/**
 * 4- Floating action button
 */
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        iconSize: 18,
      ),
      /**
     *************************************************************************
     ***************************  TextField Section **************************
     *************************************************************************
     * */
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.green,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.green)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      /**
               * *************************** Cursor Color **********************************
               */
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.green),
      /**
           * ************************* TF prefix - postfix themeing **********************
           */
      iconTheme: IconThemeData(color: Colors.green));
}
