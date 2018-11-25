

function returnroles(value) {
 //console.log(queryModel.returnRoleName(258));
    return queryModel.returnRoleName(value);
}

/*used in Qsqlquerymodel */
//function setquery(query) {
//   queryModel.setQuery(query)
//}

//function formquerystring(tableNo, RowNo) {
////    var query =  qsTr("SELECT* FROM "+(tableNo)+
////                  " WHERE qno="+(RowNo));
//    var query = "SELECT* FROM test"+tableNo+" INNER JOIN response"+tableNo
//            +" ON test"+tableNo+".qno=response"+tableNo+".qno"
//           +" WHERE test"+tableNo+".qno="+RowNo ;
//    console.log("formquerystring func()---> "+query);
//    return query;
//}

/*used for qrelationaltablemodel*/
function setquery(tableNo,RowNo) {
    console.log("handle.js sent table no "+tableNo)
   queryModel.setsqlquery(tableNo,RowNo)
}
