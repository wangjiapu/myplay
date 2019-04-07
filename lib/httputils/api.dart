import 'dart:_http';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';
import 'BaseInnerWidgetState.dart';
import 'Basewidget.dart';
import 'EntityFactory.dart';
import 'RequestErrorMsg.dart';

class HttpManager {
  static final String BASE_URL = "https:www.baidu.com";
  static final int CONNECR_TIME_OUT = 5000;
  static final int RECIVE_TIME_OUT = 3000;
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Dio _dio;

  HttpManager._internal() {
    initDio();
  }

  static HttpManager _httpManager = HttpManager._internal();

  factory HttpManager() {
    return _httpManager;
  }

  PublishSubject<T> get<T>(String url,
      {Map<String, dynamic> parameters,
      BaseWidgetState baseWidgetState,
      BaseInnerWidgetState baseInnerWidgetState,
      bool isCancelable = true,
      bool isShowLoading = true,
      bool isShowErrorToast = true}) {
    return _requestHttp(url, true, parameters, baseWidgetState,
        baseInnerWidgetState, isCancelable, isShowLoading, isShowErrorToast);
  }

  PublishSubject<T> post<T>(String url,
      {Map<String, dynamic> queryParameters,
      BaseWidgetState baseWidgetState,
      BaseInnerWidgetState baseInnerWidgetState,
      bool isCancelable = true,
      bool isShowLoading = true,
      bool isSHowErrorToast = true}) {
    return _requestHttp(url, false, queryParameters, baseWidgetState,
        baseInnerWidgetState, isCancelable, isShowLoading, isSHowErrorToast);
  }

  PublishSubject<T> _requestHttp<T>(url,
      [bool isGet,
      Map<String, dynamic> queryParameters,
      BaseWidgetState baseWidgetState,
      BaseInnerWidgetState baseInnerWidgetState,
      bool isCancelable = true,
      bool isShowLoading = true,
      bool isShowErrorToast = true]) {
    Future future;
    PublishSubject<T> publishSubject = PublishSubject<T>();
    CancelToken cancelToken;

    if (isGet) {
      //get请求
      future = _dio.get(url,
          queryParameters: queryParameters, cancelToken: cancelToken);
    } else {
      //post请求
      future = _dio.post(url, data: queryParameters, cancelToken: cancelToken);
    }

    future.then((date) {
      //这里要做错误处理
      //需要先过滤 error ， 根据和后台的 约定 ， 搞清楚什么是失败
      // 什么是成功  ， 这里只是根据了干货集中营的 返回 模拟了一下
      bool isError = json.decode(date.toString())["error"];
      if (isError) {
        callError(publishSubject, RequestErrorMsg(10, "请求失败~"), baseWidgetState,
            baseInnerWidgetState, isShowLoading, isShowErrorToast);
      } else {
        publishSubject
            .add(EntityFactory.generateOBJ<T>(json.encode(date.toString())));
        publishSubject.close();
        cancelLoading(baseWidgetState, baseInnerWidgetState, isShowLoading);
      }
    }).catchError((err) {
      callError(
          publishSubject,
          RequestErrorMsg(1, err.toString()),
          baseWidgetState,
          baseInnerWidgetState,
          isShowLoading,
          isShowErrorToast);
    });
    return publishSubject;
  }

  void initDio() {
    _dio = Dio();
    _dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = CONNECR_TIME_OUT;
    _dio.options.receiveTimeout = RECIVE_TIME_OUT;
    _dio.options.contentType = ContentType.parse(CONTENT_TYPE_FORM);
  }

  //处理返回错误的事情
  void callError(
      PublishSubject publishSubject,
      RequestErrorMsg requestErrorMsg,
      BaseWidgetState<BaseWidget> baseWidgetState,
      BaseInnerWidgetState<BaseInnerWidget> baseInnerWidgetState,
      bool isShowLoading,
      bool isShowErrorToast) {
    publishSubject.add(requestErrorMsg);
    publishSubject.close();
    if (isShowErrorToast) {
      showErrorToast(requestErrorMsg.message);
    }
    cancelLoading(baseWidgetState, baseInnerWidgetState, isShowLoading);
  }

  void cancelLoading(
      BaseWidgetState<BaseWidget> baseWidgetState,
      BaseInnerWidgetState<BaseInnerWidget> baseInnerWidgetState,
      bool isShowLoading) {
    if (baseWidgetState != null) {
      if (isShowLoading) {
        baseWidgetState.setLoadingWidgetVisible(false);
      }
    }
    if (baseInnerWidgetState != null) {
      if (isShowLoading) {
        baseInnerWidgetState.setLoadingWidgetVisible(false);
      }
    }
  }

  void showErrorToast(String message) {
    showToast(message);
  }

  void showToast(String content,
      {Toast length = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.BOTTOM,
      Color backColor = Colors.black54,
      Color textColor = Colors.white}) {
    if (content != null) {
      Fluttertoast.showToast(
          msg: content,
          toastLength: length,
          gravity: gravity,
          timeInSecForIos: 1,
          backgroundColor: backColor,
          textColor: textColor,
          fontSize: 13.0);
    }
  }
}
