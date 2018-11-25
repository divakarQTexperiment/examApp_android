#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QDebug>
#include <QQuickStyle>
#include <QQmlContext>

#if defined(Q_OS_ANDROID)
#include <QtAndroidExtras>
#endif

//class share :public QObject
//{
//Q_OBJECT

//public :
//    share(){
//        qDebug() << "share constructor called";
//    }
//    ~share() {
//        qDebug() << "share destructor called";
//    }

//    int InterfaceConnFailedException() {
//        qDebug() << "InterfaceConnFailedException !!!";
//        return -1;
//    }

//#if defined(Q_OS_ANDROID)
//  Q_INVOKABLE  void shareText(QString str) {
//        QAndroidJniEnvironment _env;
//        QAndroidJniObject activity = QAndroidJniObject::callStaticObjectMethod("org/qtproject/qt5/android/QtNative", "activity", "()Landroid/app/Activity;");   //activity is valid
//        if (_env->ExceptionCheck()) {
//            _env->ExceptionClear();
//            throw InterfaceConnFailedException();
//        }
//        if ( activity.isValid() )
//        {
//            QAndroidJniObject::callStaticMethod<void>("com/lasconic/QShareUtils","sendText","(Landroid/app/Activity;Ljava/lang/String;)V",activity.object<jobject>(),QAndroidJniObject::fromString(str).object<jstring>());
//            if (_env->ExceptionCheck()) {
//                _env->ExceptionClear();
//                throw InterfaceConnFailedException();
//            }
//        }else
//            throw InterfaceConnFailedException();
//    }

//#elif defined(Q_OS_LINUX)
//Q_INVOKABLE void shareText(QString str) {
//        qDebug() <<"this feature not yet implemented for this linux platform  "+str;
//    }
// #elif defined(Q_OS_WIN32)
//Q_INVOKABLE void shareText(QString str) {
//        qDebug <<"this feature not yet implemented for this windows platform";
//    }
//#endif
//};


//class PlatformShareUtils : public QQuickItem
//{
//public:
//    PlatformShareUtils(QQuickItem *parent = 0) : QQuickItem(parent){}
//    virtual ~PlatformShareUtils() {}
//    virtual void share(const QString &text, const QUrl &url){ qDebug() << text << url; }
//};


//class ShareUtils : public QQuickItem
//{
//    Q_OBJECT
//    PlatformShareUtils* _pShareUtils;
//public:
//    explicit ShareUtils(QQuickItem *parent = 0);
//    Q_INVOKABLE void share(const QString &text, const QUrl &url);
//};

#endif // MAINWINDOW_H
