#include "sqltablemodel.h"

/* relational table model code*/
QLSqlTableModel::QLSqlTableModel(QObject *parent, QSqlDatabase db ):QSqlRelationalTableModel(parent, db ) {

    qDebug() << "QLSqlTableModel::QLSqlTableModel : QLSqlTableModel constructor called";
}

QLSqlTableModel::~QLSqlTableModel() {

    qDebug() << "QLSqlTableModel::QLSqlTableModel : QLSqlTableModel destructor called";

}


QVariant QLSqlTableModel::data ( const QModelIndex & index, int role ) const
{
    if(index.row() >= rowCount())
    {
        return QString("");
    }
    if(role < Qt::UserRole)
    {
        return QSqlQueryModel::data(index, role);
    }
    else
    {
        // search for relationships
        for (int i = 0; i < columnCount(); i++)
        {
            if (this->relation(i).isValid())
            {
            return record(index.row()).value(QString(roles.value(role)));
            }
        }
    // if no valid relationship was found
    return QSqlQueryModel::data(this->index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
    }
}


void QLSqlTableModel::generateRoleNames()
{
    roles.clear();
//    int nbCols = this->columnCount();

//    for (int i = 0; i < nbCols; i++)
//    {
//        roles[Qt::UserRole + i + 1] = QVariant(this->headerData(i, Qt::Horizontal).toString()).toByteArray();
//    }

    roles.clear();
    for( int i = 0; i < record().count(); i ++) {
        roles.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }

  //  qDebug() <<"roles->>>>>"<< roles;

//#ifndef HAVE_QT5
//    setRoleNames(roles);
//#endif
}

void QLSqlTableModel::setsqlquery(int tableNo, int rowNo) {

    QString resp_table_name = "response"+QString::number(tableNo);
    QString test_table_name ="test"+QString::number(tableNo);
    QString filter = resp_table_name+".rowid="+QString::number(rowNo);
    qDebug() << "QLSqlTableModel::setsqlquery : recieved tableno setsqlquery "<<tableNo;

    this->setTable(resp_table_name);
    this->setFilter(filter);
    this->setJoinMode(JoinMode::InnerJoin);
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    this->setRelation(2, QSqlRelation(test_table_name, "qno",
    "qno,question,description,imagepath,option1,option2,option3,option4,option5"));
    if(this->select())
        this->generateRoleNames();
    else
        qDebug() << "QLSqlTableModel::setsqlquery : query exec failed "<< this->lastError();
    // qDebug() << "----------------";
    // qDebug() <<this->selectStatement();
     int role = this->roles.key("response");
     QModelIndex ind = this->index(0,role-Qt::UserRole);
     //qDebug() <<rowCount()<<"* "<<columnCount();
  QVariant   Qvar= this->data(ind,role);
  //qDebug() << "query exec failed"<< this->lastError();
  respVal = Qvar.toString();
 // qDebug() << respVal;

}



#if 0
bool QLSqlTableModel::setdbdata(int row,QByteArray data , int tableNo) {

    int val = this->roles.key("response");
    /* using setData*/
//  QModelIndex ind =this->createIndex(2,1) ;
//  qDebug() << ind;
//  bool k =  this->setData(this->index(2,1),"z",Qt::EditRole);
//  qDebug() << "query exec failed"<< this->lastError();
//  k =  submit();

    /* using setRecord*/
    QString tableName = "response"+QString::number(tableNo);
    this->setTable(tableName);
    this->select();
    QSqlRecord tempRec = this->record(row);
//    qDebug()<< tempRec.isEmpty();
//    qDebug() << "query exec failed"<< this->lastError();
    int  index= tempRec.indexOf("response");
    if(index != -1)
        tempRec.setValue(index ,"U");

    bool m  = this->setRecord(row,tempRec);
    qDebug() << "query exec failed"<< this->lastError();
    m =  submit();
    return m;

}
#endif

QLSqlTableModel2::QLSqlTableModel2(QObject *parent, QSqlDatabase db ):QSqlRelationalTableModel(parent, db ) {

    qDebug() << "QLSqlTableModel2::QLSqlTableModel2 : QLSqlTableModel2 constructor called";
}

QLSqlTableModel2::~QLSqlTableModel2() {

    qDebug() << "QLSqlTableModel2::QLSqlTableModel2 : QLSqlTableModel2 destructor called";

}


bool QLSqlTableModel2::setdbdata(int row,QByteArray data , int tableNo) {

//    int val = this->roles.key("response");
    /* using setData*/
//  QModelIndex ind =this->createIndex(2,1) ;
//  qDebug() << ind;
//  bool k =  this->setData(this->index(2,1),"z",Qt::EditRole);
//  qDebug() << "query exec failed"<< this->lastError();
//  k =  submit();

    /* using setRecord*/
    row=row-1;
    QString tableName = "response"+QString::number(tableNo);
    qDebug()<<"args recieved " <<row<<data<<tableNo;

    this->setTable(tableName);
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    bool k = this->select();
    if(!k)
    {
        qDebug() << "QLSqlTableModel2::setdbdata select statement failed !!";
        return false;
    }
    QSqlRecord tempRec = this->record(row);
//    qDebug()<< tempRec.isEmpty();
//    qDebug() << "query exec failed"<< this->lastError();
    int  index= tempRec.indexOf("response");
    if(index != -1)
        tempRec.setValue(index ,data);
    else {
        qDebug() << "QLSqlTableModel2::setdbdata : index = -1";
        return false;
    }

    k = this->setRecord(row,tempRec);
    if(!k) {
     qDebug() << "QLSqlTableModel2::setdbdata : query exec failed "<< this->lastError();
     return k;
    }
    k =  this->submitAll();
    if(!k) {
     qDebug() << "QLSqlTableModel2::setdbdata : submitAll failed "<< this->lastError();
     return k;
    }

    return k;

}

bool  QLSqlTableModel2::resetResponse(int tableNo) {
    QString tableName = "response"+QString::number(tableNo);
    this->setTable(tableName);
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    bool k = this->select();
    if(!k)
    {
        qDebug() << "QLSqlTableModel2::resetResponse select statement failed !!";
        return false;
    }
    int rowNo = this->rowCount();
    qDebug() << "QLSqlTableModel2::resetResponse : total row no " <<rowNo;

    for(int i=0;i<rowNo;i++) {
      k =  this->setData(this->index(i,1),"x",Qt::EditRole);
      if(k != true) {
      qDebug() << "QLSqlTableModel2::resetResponse : query exec failed "<< this->lastError()<<"----------exiting-----";
      return false;
      }
//      k =  this->submit();
//      if(k != true) {
//      qDebug() << "QLSqlTableModel2::resetResponse : query exec failed "<< this->lastError()<<"----------exiting-----";
//      return false;
//      }
    }

    k =  this->submitAll();
    if(k != true) {
    qDebug() << "QLSqlTableModel2::resetResponse : query exec failed "<< this->lastError()<<"----------exiting-----";
    return false;
    }

    return true;

}

bool QLSqlTableModel2::fill_user_info(QVariantList userdata)
{

    QString tableName = "userinfo";
    setTable(tableName);
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    bool k = this->select();
    if(!k)
    {
        qDebug() << "QLSqlTableModel2::fill_user_info select statement failed !!";
        return false;
    }
    int userIdNo  = 0;
    int rowNo = this->rowCount();
    qDebug() << "QLSqlTableModel2::fill_user_info : total row no " <<rowNo;

    int len = userdata.length();

    for(int i=1 ; i <= len ; i++) {
      k =  this->setData(this->index(userIdNo,i),userdata[i-1].toString(),Qt::EditRole);
      if(k != true) {
      qDebug() << "QLSqlTableModel2::fill_user_info : query exec failed "<< this->lastError()<<"----------exiting-----";
      return false;
      }
    }
    k =  this->submitAll();
    if(k != true) {
    qDebug() << "QLSqlTableModel2::fill_user_info : query exec failed "<< this->lastError()<<"----------exiting-----";
    return false;
    }

    return true;

}

bool copyobj::copy_db_file_from_asset() {

    QString mDataRoot = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);   //QStandardPaths::standardLocations(QStandardPaths::AppDataLocation).value(0);
    qDebug() <<"copyobj::copy_db_file_from_asset : " <<mDataRoot;
    qDebug() <<"copyobj::copy_db_file_from_asset : " <<QStandardPaths::standardLocations(QStandardPaths::AppDataLocation).value(0);
    QString path = mDataRoot + "/applicationdb";
    this->appdatalocatndb = path;
    this->assetsdb = "assets:/applicationdb";
    QDir myDir;
        bool exists;
        exists = myDir.exists(mDataRoot);
        if (!exists) {
            bool ok = myDir.mkpath(mDataRoot);
            if(!ok) {
                qWarning() << "Couldn't create mDataRoot " << mDataRoot;
                return false;
            }
            else {
            qDebug() << "copyobj::copy_db_file_from_asset : created directory mDataRoot " << mDataRoot;
            }
        }

        exists = QFile::exists(path);
//        if(exists) {
//            qDebug() << "destination folder already contains db file";
//            if(myDir.remove(path)) {
//                qDebug() << "file removed !!";
//            }
//            else {
//                qDebug() << "file not able to remove !!";
//                return false;
//            }
//        }
//        else {
//            qDebug() << "destination folder doesnt contains db file,need to to copy";
//        }
        if(!exists)
        {
            QFile file;
            file.setFileName(this->assetsdb);
            if(file.exists())
            {
                 bool zz = file.copy(path);
                // qDebug() << zz;
                 if(zz) {
                     qDebug() << "copyobj::copy_db_file_from_asset : db file copied!!";
                 }
                 else {
                     qDebug() << "copyobj::copy_db_file_from_asset : db file not copied!!";
                     return false;
                 }
            }
            else  {
                qDebug() << "copyobj::copy_db_file_from_asset : assets folder dosent contain db file";
                return false;
            }

           bool zz = QFile::setPermissions(path, QFile::WriteOwner | QFile::ReadOwner);
            if(zz) {
                qDebug() << "copyobj::copy_db_file_from_asset : permission set to write and read !!";
            }
            else {
                qDebug() << "copyobj::copy_db_file_from_asset : failed to set write read permission";
                return false;
            }
        }

//        exists = QFile::exists(path);
//        if(exists) {
//            qDebug() << "copyobj::copy_db_file_from_asset : destination folder already contains db file";
//        }
        else {
            qDebug() << "copyobj::copy_db_file_from_asset : db file already there in appdatalocation !!";
            //return false;
        }
    this->dbPath = path;
    return true;

}

//bool copyobj::copy_back_to_assets() {

//    bool exists = QFile::exists(this->appdatalocatndb);
//    if(exists) {
//        qDebug() << "destination folder already contains db file";
//    }
//    else {
//        qDebug() << "destination folder doesnt contains db file,need to to copy";
//        return false;
//    }
//    QDir myDir;
//    QFile file;
//    file.setFileName(this->appdatalocatndb);
//    if(file.exists())
//    {

//        bool zz = QFile::setPermissions(this->assetsdb, QFile::WriteOwner | QFile::ReadOwner | QFileDevice::WriteUser | QFileDevice::ReadUser | QFileDevice::WriteOther | QFileDevice::ReadOther | QFileDevice::ReadGroup | QFileDevice::WriteOther);
//        if(zz) {
//            qDebug() << "permission set to write and read !!";
//        }
//        else {
//            qDebug() << "failed to set write read permission";
//           // return false;
//        }
//        if(myDir.remove(this->assetsdb)) {
//            qDebug() << "db file removed assets folder!!";
//        }
//        else {
//            qDebug() << "db file not able to removed assets folder !!";
//            //return false;
//        }

//          zz = file.copy(this->assetsdb);
//         if(zz) {
//             qDebug() << "db file copied back to assets!!";
//         }
//         else {
//             qDebug() << "db file not copied back to assets!!";
//             return false;
//         }
//    }
//    else  {
//        qDebug() << "appdatalocation folder dosent contain db file";
//        return false;
//    }
//  return true;


//}


evaluteAnsObj::evaluteAnsObj(QObject *parent, QSqlDatabase db) {
    qDebug() << "evaluteAnsObj::evaluteAnsObj : evaluteAnsObj created";
}


void evaluteAnsObj::evalAnsw(int tableNo) {
    QString respTable  = "response" + QString::number(tableNo);
    QString answerTable = "answer" + QString::number(tableNo);
    qDebug() <<"evaluteAnsObj::evalAnsw: " <<respTable+answerTable;
    QSqlRelationalTableModel respdb;
    QSqlRelationalTableModel answdb;
    int totalanswer = 0 , passanswer = 0 , failanswer = 0 , notanswer = 0;
    //QString respvalidation("");
    respdb.setTable(respTable);
    answdb.setTable(answerTable);
    if(answdb.select() && respdb.select()) {
        int rowanswdb = answdb.rowCount();
        int rowrespdb = respdb.rowCount();
        if(rowanswdb == rowrespdb) {
            totalanswer = rowanswdb;
            for(int row = 0 ; row < rowanswdb ; row++)
            {
                QModelIndex indx = QAbstractItemModel::createIndex(row,1);
                QString actualansw = answdb.data(indx).toString();
                QString responsansw =  respdb.data(indx).toString();
                total_answer_list.append(QString::number(row+1));
                //qDebug()<<"evaluteAnsObj::evalAnsw: "  << actualansw << responsansw;
                if(actualansw == responsansw[0]) {
                    passanswer++;
                //    respvalidation += QString::number(row+1)+"p";
                    correct_answer_list.append(1);
                    wrong_answer_list.append(0);
                    not_answer_list.append(0);
                }
                else if(responsansw == "n") {
                    notanswer++;
                 //   respvalidation += QString::number(row+1)+"n";
                    correct_answer_list.append(0);
                    wrong_answer_list.append(0);
                    not_answer_list.append(1);
                }
                else {
                    failanswer++;
                   // respvalidation += QString::number(row+1)+"f";
                    correct_answer_list.append(0);
                    wrong_answer_list.append(1);
                    not_answer_list.append(0);

                }
            }
        }
    }

    qDebug() << "evaluteAnsObj::evalAnsw:totalanswer,passanswer,failanswer,notanswer"\
             << totalanswer << passanswer << failanswer << notanswer  ;
//    qDebug () << "evaluteAnsObj::evalAnsw:correct_answer_list " << correct_answer_list;
//    qDebug() << "evaluteAnsObj::evalAnsw:wrong_answer_list " << wrong_answer_list;
//    qDebug() << "evaluteAnsObj::evalAnsw:not_answer_list " << not_answer_list;
  //  qDebug() << "evaluteAnsObj::evalAnsw:total_answer_list " << total_answer_list;
    this->total_num_of_answer = totalanswer;
    this->correct_answer = passanswer;
    this->wrong_answer = failanswer;
    this->not_answered = notanswer;
   // this->result_string = respvalidation;

}

userdatamodel::userdatamodel(QObject *parent, QSqlDatabase db):QSqlRelationalTableModel(parent, db )
{
    qDebug() << "userdatamodel::userdatamodel : constructor called!!";

}

userdatamodel::~userdatamodel()
{
    qDebug() << "userdatamodel::userdatamodel : destructor called!!";
}

bool userdatamodel::fill_user_info(QVariantList userdata)
{

    QString tableName = "userinfo";
    setTable(tableName);
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    bool k = this->select();
    if(!k)
    {
        qDebug() << "QLSqlTableModel2::fill_user_info select statement failed !!";
        return false;
    }
    int userIdNo  = 0;
    int rowNo = this->rowCount();
    qDebug() << "QLSqlTableModel2::fill_user_info : total row no " <<rowNo;

    int len = userdata.length();

    for(int i=1 ; i <= len ; i++) {
      k =  this->setData(this->index(userIdNo,i),userdata[i-1].toString(),Qt::EditRole);
      if(k != true) {
      qDebug() << "QLSqlTableModel2::fill_user_info : query exec failed "<< this->lastError()<<"----------exiting-----";
      return false;
      }
    }
    k =  this->submitAll();
    if(k != true) {
    qDebug() << "QLSqlTableModel2::fill_user_info : query exec failed "<< this->lastError()<<"----------exiting-----";
    return false;
    }

    return true;
}


bool userdatamodel::return_userinfo()
{

    QString tableName = "userinfo";
    QStringList userinfolist ;
    this->setTable(tableName);
    this->setFilter("rowid=0");
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    if(!this->select())
    {
        qDebug() << "userdatamodel::create_userinf_model : query exec failed "<< this->lastError();
        return false;
    }
    int len = this->columnCount();
    for(int col = 1 ; col <= len ; col++ )
    userinfolist.append(QString(this->data(this->index(0,col)).toString()));

    this->userinfolist = userinfolist;
    qDebug() << this->userinfolist.at(0);

    return true;
}
