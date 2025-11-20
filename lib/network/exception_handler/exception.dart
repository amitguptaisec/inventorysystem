import 'package:flutter/material.dart';

class ExceptionHandler {
  handleException(String error) {
    return handleError(error);
  }

  handleError(String error) {
    if (error.isEmpty) {
      return "No Data Found";
    } else if (error.toLowerCase().contains("your session id is expired")) {
      // _helper.popAll(NavigationKey.navigatorKey.currentContext, error,
      //     "Your Session Id is Expired",isSessionExpired:true);
      return "Your Session Id is Expired";
    } else if (error.toLowerCase().contains("less than 8 characters")) {
      return "Password is Less than 8 Characters";
    } else if (error.toLowerCase().contains("incorrect Password")) {
      return "You have entered an invalid username or password";
    } else if (error.toLowerCase().contains("failed host lookup")) {
      return "Something went wrong.\nWe couldn't fetch the data... please try again!";
    } else if (error.toLowerCase().contains("user account is locked")) {
      return "Your Account is locked plz Contact admin for unlock";
    } else if (error.toLowerCase().contains("incorrect OTP")) {
      return error;
    } else if (error.toLowerCase().contains("incorrect TOTP")) {
      return error;
    } else if (error.contains("BE0002")) {
      return error;
    } else if (error.toLowerCase().contains(
      "new pin can not be same as old pin.",
    )) {
      return error;
    } else if (error.toLowerCase().contains("no data found")) {
      return error;
    } else if (error.toLowerCase().contains(
          "your session has expired. please login again using user id & password.",
        ) ||
        error.toLowerCase().contains(
          "invalid user:the login id entered is not valid",
        ) ||
        error.toLowerCase().contains("invalid session") ||
        error.toLowerCase().contains(
          "couldn't complete fingerprint based login",
        )) {
      // _helper.popAll(NavigationKey.navigatorKey.currentContext, error,
      //     "Your Session Id is Expired",isSessionExpired:true);
    } else if (error.toLowerCase().contains(
      "connection closed before full header was received",
    )) {
      return "Something went wrong...\nWe couldn't fetch the data. Please try again!";
    } else if (error.toLowerCase().contains("handshakeexception")) {
      return "Something went wrong,\nWe couldn't fetch the data. Please try again!";
    } else if (error.toLowerCase().contains("handshake exception")) {
      return "Something went Wrong.\nWe couldn't fetch the data. Please try again!";
    } else if (error.toLowerCase().contains(
      "software caused connection abort",
    )) {
      return "Something went wrong.\nWe couldn't fetch the data .... Please try again!";
    } else if (error.toLowerCase().contains(
      "system has encountered an error for connection",
    )) {
      return "Something went wrong.\nWe couldn't fetch the data, Please try again!";
    } else if (error.toLowerCase().contains("tpetime") ||
        error.toLowerCase().contains("tpesvcfail") ||
        error.toLowerCase().contains(
          "error while calling service, please contact admin (t2old:238)",
        )) {
      // TPETIME - timeout occured (T2:176)
      List<String> split = error.split("(");
      debugPrint("$split");
      String errorCode = "";
      if (split.isNotEmpty) {
        errorCode = "(${split[1]}";
      }
      return "Something went wrong.\nWe couldn’t fetch the data. Please try again!\n$errorCode";
    } else if (error.toLowerCase().contains("resource not available")) {
      return "Something went wrong.\nWe couldn't fetch the data. Please try again!\n(RNA)";
    } else if (error.toLowerCase().contains(
          "the request connection took longer than",
        ) ||
        error.toLowerCase().contains("the request took longer than")) {
      return "Something went wrong.\nWe couldn't fetch the data. Please try again!!!";
    } else if (error.toLowerCase().contains("httpexception") ||
        error.toLowerCase().contains("https://uatapi.icicidirect.com/") ||
        error.toLowerCase().contains("https://api.icicidirect.com/")) {
      return "Something went wrong.\nWe couldn't fetch the data. Please try again!!";
    } else if (error.toLowerCase().contains("nosuchmethoderror")) {
      return "Something went wrong.\nWe couldn't fetch the data. Please try Again!";
    } else if (error.toLowerCase().contains(
          "the request returned an invalid status code of 429",
        ) ||
        error.toLowerCase().contains("429") ||
        error.toLowerCase().contains("429 too many requests")) {
      return "You are hitting too many request, please try after sometime";
    } else if (error.toLowerCase().contains(
      "connection closed before full header was received",
    )) {
      return "Something went wrong..\nWe couldn't fetch the data. Please try again!";
    } else if (error.toLowerCase().contains("invalid input")) {
      return "Something went wrong.\nWe couldn't fetch the data.. Please try again!";
    } else if (error.toLowerCase().contains(
      "system.servicemodel.endpointnotfoundexception",
    )) {
      return "Something went wrong.\nWe couldn't fetch the data. Please try again..";
    } else if (error.toLowerCase().contains(
      "socketexception: connection reset by peer",
    )) {
      return "Something went wrong.\nWe couldn't fetch the data. Please try again!..";
    } else if (error.toLowerCase().contains(
      "socketexception: connection failed",
    )) {
      return "Something went wrong.\nWe couldn't fetch the data. Please Try Again!";
    } else if (error.toLowerCase().contains("is not a subtype of type")) {
      return "Please try again!..";
    } else {
      return error;
    }
  }
}
