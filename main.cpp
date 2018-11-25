#include "mainwindow.h"
#include "sqltablemodel.h"
#include <QStandardPaths>
#include <QMessageBox>
#include <QtWidgets>
#include <QGuiApplication>
#include <shareutils.h>
#include<QSplashScreen>
#include<QTimer>
#include"timetable.h"
#include"sortfilterclass.h"


int main(int argc, char *argv[])
{
//#if defined(Q_OS_WIN)
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
//#endif

   // QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
   // QGuiApplication app(argc, argv);
    //QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //qputenv("QT_QUICK_CONTROLS_STYLE", "material");
   // qputenv("QT_SCALE_FACTOR", "0.75");
   // qputenv("QT_AUTO_SCREEN_SCALE_FACTOR", "1");


    //for high dpi
    //qputenv("QT_SCALE_FACTOR", "0.75");
    //setting control style to android
   //qputenv("QT_QUICK_CONTROLS_STYLE", "material");

    //enabling hign dpi
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //qputenv("QT_SCALE_FACTOR", "1");

    QApplication app(argc,argv);
    //setting control style to android
   QQuickStyle::setStyle("material");//universal ,default,material,imagine,Fusion

    QQmlApplicationEngine engine;

    // from QML we have access to ApplicationUI as calObj
    QQmlContext* context = engine.rootContext();

    //sqlquery model object
 //  static QString database_path_ = "/home/divakar/qtprojects/cppsqlmodel/database/applicationdb2";
   //  QString database_path_ = "/applicationdb2";
    copyobj copyobj1;
    QString path = copyobj1.dbPath;
#if defined(Q_OS_ANDROID)
   bool pass  = copyobj1.copy_db_file_from_asset();
   if(!pass)
       return -1;
   path = copyobj1.dbPath;
#else    //#elif defined(Q_OS_LINUX) #elif defined(Q_OS_WIN32)
   path = "applicationdb";
#endif



  QSqlDatabase *question_table = new QSqlDatabase(QSqlDatabase::addDatabase("QSQLITE"));
     question_table->setDatabaseName(path);
     //bool op = question_table->open();

  if (!(question_table->open())) {
//      QMessageBox::critical(nullptr, QObject::tr("Cannot open database"),
//          QObject::tr("Unable to establish a database connection.\n"
//                      "This example needs SQLite support. Please read "
//                      "the Qt SQL driver documentation for information how "
//                      "to build it.\n\n"
//                      "Click Cancel to exit."), QMessageBox::Cancel);
      qDebug() <<" main.c : " <<question_table->lastError();
      return false;
  }


    QLSqlTableModel dataModel(nullptr,*question_table);
    dataModel.setsqlquery(11,1);
    QLSqlTableModel2 dataEdit(nullptr,*question_table);
    evaluteAnsObj evalobj(nullptr,*question_table);
    userdatamodel userinfo(nullptr,*question_table);
    userinfo.return_userinfo();
    QLSqlTimeTableModel timeTableObj(nullptr,*question_table);
    timeTableObj.setsqlquery("MONDAY");

    myModelfilterClass proxyModel;

     proxyModel.setSourceModel(&timeTableObj);
     proxyModel.setDynamicSortFilter(false);
     proxyModel.setSortRole(257);
     proxyModel.sort(1,Qt::DescendingOrder);

    //proxyModel.setFilterRole(Qt::UserRole);


    int ok = qmlRegisterType<ShareUtils>("QtShareButton", 1, 0, "ShareUtils");
    qDebug() <<ok;
    ok = qmlRegisterType<QLSqlTimeTableModel>("TimeTableModel.custom", 1, 0, "QLSqlTimeTableModel");
    qDebug() <<ok;
    ok = qmlRegisterType<myModelfilterClass>("customSortfilter", 1, 0, "myModelfilterClass");
    qDebug() <<ok;


#if defined(Q_OS_ANDROID)
    //    qmlRegisterType<QtAndroidShare>("QtAndroidShare", 1, 0, "ShareIntent");
//    context->setContextProperty("shareIntent", new QtAndroidShare());
    //qmlRegisterType<QtAndroidShare>("QtAndroidShare", 1, 0, "ShareIntent");
    //context->setContextProperty("shareIntent", new QtAndroidShare());
#endif

    context->setContextProperty("queryModel", &(dataModel));
    context->setContextProperty("writeToDb", &(dataEdit));
    context->setContextProperty("copyob1",&copyobj1);
    context->setContextProperty("evalobj",&evalobj);
    context->setContextProperty("userInfo",&userinfo);
    context->setContextProperty("timeTableModel",&timeTableObj);
     context->setContextProperty("proxyModel",&proxyModel);


//    QSplashScreen splash;
//    splash.setPixmap(QPixmap("/home/divakar/qtprojects/gkpp2.0/android_data/res/drawable/ic_launcher.png"));
//    splash.show();
//    QTimer::singleShot(2500,&splash,SLOT (close()));
//    QTimer::singleShot(2500,&splash,SLOT (close()));


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

#if defined(Q_OS_ANDROID)
    QtAndroid::hideSplashScreen(1000);
#endif

    qDebug() <<" main.c : primaryscreen "<<app.primaryScreen() ;
    qDebug() <<"main.c : device pixel ratio "<<app.devicePixelRatio();
    qDebug() << qApp->primaryScreen()->devicePixelRatio();
    qDebug() << qApp->primaryScreen()->size();



    return app.exec();
}
