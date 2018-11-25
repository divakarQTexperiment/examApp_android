#ifndef TIMETABLE_H
#define TIMETABLE_H
#include <QtSql>
#include<QDebug>
#include <QSqlQuery>

/*relationtable model for reading from db */
class QLSqlTimeTableModel : public QSqlRelationalTableModel
{
    Q_OBJECT
    Q_PROPERTY(QString dayTableName_m MEMBER MyTableName )


private:
    QHash<int, QByteArray> roles; //hash table <key,value>

public:
    QLSqlTimeTableModel(QObject *parent=nullptr, QSqlDatabase db=QSqlDatabase());
    ~QLSqlTimeTableModel();

public:
    const int MAXACTIVITYCOUNT = 30;
    QString MyTableName;

    Q_INVOKABLE QVariant data(const QModelIndex &index, int role=Qt::DisplayRole ) const;
    void generateRoleNames();
    QHash<int, QByteArray> roleNames() const {
        qDebug() << roles;
        return roles;
    }
    Q_INVOKABLE int setsqlquery(QString tableNo);
    Q_INVOKABLE bool append(QString tableName);
    Q_INVOKABLE bool remove(int index,QString TableName);
    bool InsertNewDatadb(int rowNo,QString TableName ,QStringList data);
    void setSort(int column, Qt::SortOrder order);

//    QString get_MyTableName(){ return MyTableName;}
//    void set_MyTableName(QString tableName){ MyTableName = tableName;}

};


#endif // TIMETABLE_H
