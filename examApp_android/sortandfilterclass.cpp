#include"sortfilterclass.h"
#include <QDebug>

myModelfilterClass::myModelfilterClass(QObject *parent ,QAbstractItemModel * sourceModel): QSortFilterProxyModel (parent)
{
    qDebug() << "myModelfilterClass constructor called";
    this->setSourceModel(sourceModel);
}

myModelfilterClass::~myModelfilterClass()
{
    qDebug() << "myModelfilterClass destructor called";
}

void myModelfilterClass::setSourceModel(QAbstractItemModel * sourceModel)
{
    QSortFilterProxyModel::setSourceModel(sourceModel);
    qDebug() << "source model is set";
}


QLSqlTimeTableModel * myModelfilterClass::sourceModel()
{
    return ((QLSqlTimeTableModel *) QSortFilterProxyModel::sourceModel());
}

bool myModelfilterClass::removeRows(int row, int count, const QModelIndex &parent)
{

 QSortFilterProxyModel::beginRemoveRows(parent,row,row+1);
 bool k=   QSortFilterProxyModel::removeRows(row,count);
 QSortFilterProxyModel::endRemoveRows();

// k=   sourceModel()->submitAll();


 return k;
}
