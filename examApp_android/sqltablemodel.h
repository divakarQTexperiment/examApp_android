#ifndef SQLTABLEMODEL_H
#define SQLTABLEMODEL_H

#include <assert.h>
#include <QSqlRelationalTableModel>
#include <QSqlQueryModel>
#include <QtSql>
#include<QDebug>
#include <QSqlQuery>

/*relationtable model for reading from db */
class QLSqlTableModel : public QSqlRelationalTableModel
{
    Q_OBJECT
private:
    QHash<int, QByteArray> roles; //hash table <key,value>

public:
    QLSqlTableModel(QObject *parent=nullptr, QSqlDatabase db=QSqlDatabase());
    ~QLSqlTableModel();

public:
    Q_INVOKABLE QVariant data(const QModelIndex &index, int role=Qt::DisplayRole ) const;
    void generateRoleNames();
    QHash<int, QByteArray> roleNames() const {return roles; }
    Q_INVOKABLE void setsqlquery(int tableNo,int rowNo);
    QString respVal = "";
    Q_INVOKABLE QString retRespVal() {return respVal;}

};


class copyobj :public QObject
{

  Q_OBJECT
private :
    QString assetsdb,appdatalocatndb;

public :
    copyobj(QObject *parent=nullptr) {
        qDebug() << "copyobj::copyobj : copyobj constructor called";
    }
    Q_INVOKABLE bool copy_db_file_from_asset();
//    Q_INVOKABLE bool copy_back_to_assets();
    Q_INVOKABLE QString dbPath=NULL;
};


class evaluteAnsObj : public QSqlRelationalTableModel
{
    Q_OBJECT
    Q_PROPERTY(int correctanswer MEMBER correct_answer )
    Q_PROPERTY(int wronganswered MEMBER wrong_answer )
    Q_PROPERTY(int notanswered MEMBER not_answered )
    Q_PROPERTY(int totalnumofans MEMBER total_num_of_answer )
    Q_PROPERTY(QVariantList correctanswerlist MEMBER correct_answer_list )
    Q_PROPERTY(QVariantList wronganswerlist MEMBER wrong_answer_list )
    Q_PROPERTY(QVariantList notanswerlist MEMBER not_answer_list )
    Q_PROPERTY(QStringList  totalanswerlist MEMBER total_answer_list )

public :
    evaluteAnsObj(QObject *parent=nullptr, QSqlDatabase db=QSqlDatabase());
    Q_INVOKABLE void evalAnsw(int tableNo);
    int correct_answer = 0;
    int wrong_answer = 0;
    int not_answered = 0;
    int total_num_of_answer = 0;
    QVariantList correct_answer_list,wrong_answer_list,not_answer_list;
    QStringList total_answer_list;
};



/*relationTable for editing database*/
class QLSqlTableModel2 : public QSqlRelationalTableModel
{
    Q_OBJECT
private:

public:
    QLSqlTableModel2(QObject *parent=nullptr, QSqlDatabase db=QSqlDatabase() );
    ~QLSqlTableModel2();

public:
    Q_INVOKABLE bool setdbdata(int row,QByteArray data,int tableNo);
    Q_INVOKABLE bool resetResponse(int table);
    Q_INVOKABLE bool fill_user_info(QVariantList userInfo);
};

class userdatamodel : public QSqlRelationalTableModel
{
    Q_OBJECT
    Q_PROPERTY(QStringList userinfo MEMBER userinfolist )
    Q_PROPERTY(QString teststr MEMBER teststr )


private:

public:
    userdatamodel(QObject *parent=nullptr, QSqlDatabase db=QSqlDatabase());
    ~userdatamodel();

public:
    Q_INVOKABLE bool fill_user_info(QVariantList userInfo);
    QStringList userinfolist ;
    QString teststr = "divakar";
    Q_INVOKABLE bool return_userinfo();

};


#endif // SQLTABLEMODEL_H
