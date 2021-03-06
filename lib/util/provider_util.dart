import 'package:flutter/material.dart';
import 'package:flutter_bill/bean/bill_bean.dart';
import 'package:flutter_bill/model/bill_model.dart';
import 'package:flutter_bill/model/global_model.dart';
import 'package:flutter_bill/model/home_page_model.dart';
import 'package:flutter_bill/model/icon_setting_model.dart';
import 'package:flutter_bill/model/theme_page_model.dart';
import 'package:flutter_bill/model/words_wall_model.dart';
import 'package:flutter_bill/page/bill_detail/bill_detail_page.dart';
import 'package:flutter_bill/page/home/home_page.dart';
import 'package:flutter_bill/page/icon/add_icon_page.dart';
import 'package:flutter_bill/page/icon/icon_settting_page.dart';
import 'package:flutter_bill/page/theme_page/theme_page.dart';
import 'package:flutter_bill/page/user/user_page.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ProviderUtil {
  static GlobalModel _globalModel = GlobalModel();

  static HomePageModel _homePageModel = HomePageModel();

  static BillModel _billModel = BillModel();

  static WordsWallModel _wordsWallModel = WordsWallModel();

  static IconSettingModel _iconSettingModel = IconSettingModel();

  static IconSettingModel get iconSettingModel => _iconSettingModel;

  static WordsWallModel get wordsWallModel => _wordsWallModel;

  // 主题配置
  static ThemePageModel _themePageModel = ThemePageModel();

  static BillModel getBillModel() {
    return _billModel;
  }

  static GlobalModel getGlobal() {
    return _globalModel;
  }

  static refreshBillModel() {
    _billModel.refresh();
  }

  // 获取主入口
  static ChangeNotifierProvider<GlobalModel> getGlobalModelAndMyApp() {
    return ChangeNotifierProvider<GlobalModel>.value(
      value: _globalModel,
      child: MyApp(),
    );
  }

  static MultiProvider getUserPage() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageModel>.value(value: _homePageModel),
        ChangeNotifierProvider<BillModel>.value(value: _billModel),
      ],
      child: UserPage(),
    );
  }

  static ChangeNotifierProvider<GlobalModel> getGlobalModel({Widget child}) {
    return ChangeNotifierProvider<GlobalModel>.value(
      value: _globalModel,
      child: child,
    );
  }

  // 获取注入ThemeModel的theme配置页面
  static ChangeNotifierProvider<ThemePageModel> getThemePage() {
    return ChangeNotifierProvider<ThemePageModel>.value(
      value: _themePageModel,
      child: ThemePage(),
    );
  }

  static ChangeNotifierProvider<HomePageModel> getHomePage() {
    _homePageModel.assetsLocalize();
    return ChangeNotifierProvider<HomePageModel>.value(
      value: _homePageModel,
      child: HomePage(),
    );
  }

  static ChangeNotifierProvider<HomePageModel> getHomeModel({Widget child}) {
    return ChangeNotifierProvider<HomePageModel>.value(
      value: _homePageModel,
      child: child,
    );
  }

  static ChangeNotifierProvider<WordsWallModel> getWordsWallPage(Widget child) {
    return ChangeNotifierProvider<WordsWallModel>.value(
      value: _wordsWallModel,
      child: child,
    );
  }

  static ChangeNotifierProvider<BillModel> getBillModelPage(Widget child) {
    return ChangeNotifierProvider<BillModel>.value(
      value: _billModel,
      child: child,
    );
  }

  // 获取bill详情页面
  static ChangeNotifierProvider<BillModel> getBillDetailPage(
      {int index,
      bool edit,
      BillBean billBean,
      Icon icon,
      String name,
      int type,
      String heroTag}) {
    return ChangeNotifierProvider<BillModel>.value(
      value: _billModel,
      child: BillDetailPage(
        index: index,
        edit: edit,
        billBean: billBean,
        icon: icon,
        name: name,
        type: type,
        heroTag: heroTag,
      ),
    );
  }

  static ChangeNotifierProvider<IconSettingModel> getIconSettingPage() {
    return ChangeNotifierProvider<IconSettingModel>.value(
      value: _iconSettingModel,
      child: IconSettingPage(),
    );
  }

  static ChangeNotifierProvider<IconSettingModel> getAddIconPage() {
    return ChangeNotifierProvider<IconSettingModel>.value(
      value: _iconSettingModel,
      child: AddIconPage(),
    );
  }
}
