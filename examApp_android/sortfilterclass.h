#ifndef SORTFILTERCLASS_H
#define SORTFILTERCLASS_H

#include <QSortFilterProxyModel>
#include "timetable.h"

class myModelfilterClass : public QSortFilterProxyModel
{
   Q_OBJECT
   Q_PROPERTY(QLSqlTimeTableModel* sourceModel_m READ sourceModel CONSTANT FINAL)

    public:
    myModelfilterClass(QObject *parent = nullptr,QAbstractItemModel * sourceModel = nullptr);
    ~myModelfilterClass();
    void setSourceModel(QAbstractItemModel * sourceModel);
    QLSqlTimeTableModel * sourceModel();
   Q_INVOKABLE bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex());

};


#endif // SORTFILTERCLASS_H
