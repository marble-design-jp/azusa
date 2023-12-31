<!-- SMP_DYNAMIC_PAGE DISPLAY_ERRORS=ON NAME=SAMPLE -->
<?php
session_start();
?>
<?php
$api_token = '00002G97njC006ea9dd670bcae85361cc649c9e1e1a1fd56bb0d';
$api_token_secret = '49f9ca121d13bc0056ebe072273768e4e7488212';

$SPIRAL->setApiToken($api_token, $api_token_secret);
$api_communicator = $SPIRAL->getSpiralApiCommunicator();
$passkey = time();
$key = $api_token . '&' . $passkey;
$signature = hash_hmac('sha1', $key, $api_token_secret, false);
$db_title = 'azusa_answerDB';

$search_condition_answer_1 = array(
    array("name" => "answer_status", "value" => 1) // 1:回答中 ; 2:完了
);
$search_condition_answer_2 = array(
    array("name" => "answer_status", "value" => 2) // 1:回答中 ; 2:完了
);

if ($SPIRAL->getContextByFieldTitle("kind") == 2) {
    array_push($search_condition_answer_1, array("name" => "department_id", "value" => $SPIRAL->getContextByFieldTitle("department_id")));
    array_push($search_condition_answer_2, array("name" => "department_id", "value" => $SPIRAL->getContextByFieldTitle("department_id")));
}
if ($SPIRAL->getContextByFieldTitle("kind") == 3) {
    array_push($search_condition_answer_1, array("name" => "search_id", "value" => '%' . $SPIRAL->getContextByFieldTitle("loginID") . '%', "operator" => "LIKE"));
    array_push($search_condition_answer_2, array("name" => "search_id", "value" => '%' . $SPIRAL->getContextByFieldTitle("loginID") . '%', "operator" => "LIKE"));
}
$columns =  [
    'id',
    'answerID',
    'companyID',
    'companyName',
    'personID',
    'azusa_kind', // 1: 国内; 2: 監査役
    'department_id',
    'answer_status',
    'search_id',
    'registDate',
];

// get api answer status 1
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title);
$request->put("signature", $signature);
$request->put("select_columns", $columns);
$request->put("search_condition", $search_condition_answer_1);

$response = $api_communicator->request("database", "select", $request);
$conf_data = $response->getString('data');

// $countColumns = count($columns);
foreach ($conf_data as &$src) {
    $src = array_combine($columns, $src);
}
$dataAnswerStatus1 = json_encode($conf_data);

// get api answer status 2
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title);
$request->put("signature", $signature);
$request->put("select_columns", $columns);
$request->put("search_condition", $search_condition_answer_2);

$response = $api_communicator->request("database", "select", $request);
$conf_data = $response->getString('data');

// $countColumns = count($columns);
foreach ($conf_data as &$src) {
    $src = array_combine($columns, $src);
}
$dataAnswerStatus2 = json_encode($conf_data);

$db_title_2 = 'azusa_relationDB';
$columns_2 =  [
    'id',
    'registDate',
    'lastupDate',
    'relationriskID',
    'companyID',
    'companyName',
    'personID',
    'azusa_status',
    'answer_status',
    'search_id',
];

$search_condition_relation_1 = array(
    array("name" => "answer_status", "value" => 1) // 1:回答中 ; 2:完了
);
$search_condition_relation_2 = array(
    array("name" => "answer_status", "value" => 2) // 1:回答中 ; 2:完了
);

if ($SPIRAL->getContextByFieldTitle("kind") == 2) {
    array_push($search_condition_relation_1, array("name" => "department_id", "value" => $SPIRAL->getContextByFieldTitle("department_id")));
    array_push($search_condition_relation_2, array("name" => "department_id", "value" => $SPIRAL->getContextByFieldTitle("department_id")));
}

if ($SPIRAL->getContextByFieldTitle("kind") == 3) {
    array_push($search_condition_relation_1, array("name" => "search_id", "value" => '%' . $SPIRAL->getContextByFieldTitle("loginID") . '%', "operator" => "LIKE"));
    array_push($search_condition_relation_2, array("name" => "search_id", "value" => '%' . $SPIRAL->getContextByFieldTitle("loginID") . '%', "operator" => "LIKE"));
}
// get api relation answer status 1
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title_2);
$request->put("signature", $signature);
$request->put("select_columns", $columns_2);
$request->put("search_condition", $search_condition_relation_1);

$response = $api_communicator->request("database", "select", $request);
$conf = $response->getString('data');


// $countColumns = count($columns);
foreach ($conf as &$src) {
    $src = array_combine($columns_2, $src);
}
$dataRelationStatus1 = json_encode($conf);

// get api relation answer status 2
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title_2);
$request->put("signature", $signature);
$request->put("select_columns", $columns_2);
$request->put("search_condition", $search_condition_relation_2);

$response = $api_communicator->request("database", "select", $request);
$conf = $response->getString('data');

// $countColumns = count($columns);
foreach ($conf as &$src) {
    $src = array_combine($columns_2, $src);
}
$dataRelationStatus2 = json_encode($conf);

?>
<html>

<head>
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<style>
    .smp-card-list {
        border-collapse: collapse;
        border: 1px solid #999999;
        margin: auto;
    }

    .smp-card-list th {
        background-color: #DEDEDE;
        border: 1px solid #999999;
        padding: 5px;
        width: 150px;
        font-size: 10pt;
        text-align: left;
    }

    .smp-card-list td {
        background-color: #FFFFFF;
        border: 1px solid #999999;
        padding: 5px;
        width: 300px;
        font-size: 10pt;
        text-align: left;
    }

    .mainBody {
        background-color: #FFFFFF;
        padding: 20 50 50 50;
        width: 800px;
    }

    body {
        padding: 0px;
    }

    .whole {
        padding: 20px;
        text-align: center;
    }

    .smp-table th {
        border: 1px solid #999999;
        padding: 5px;
        font-size: 10pt;
        font-weight: bold;
        color: #444444;
        background-color: #DCDCDE;
    }

    form {
        margin: 0;
        padding: 0;
    }

    .smp-search-form {
        padding: 20px 20px 5px 20px;
    }

    .smp-search-form div {
        padding: 1px;
    }

    .smp-pager a {
        color: #8080FF;
        font-weight: bold;
        padding: 1px 5px;
        text-decoration: none;
    }

    .smp-table {
        margin: 10 0 0 0;
    }

    .smp-page {
        background-color: #FFFFFF;
        text-align: center;
        width: 15px;
        padding: 0px;
        margin: 0px;
    }

    .smp-current-page {
        color: #202020;
        font-weight: bold;
        padding: 0px 2px;
    }

    .smp-page a {
        border: 1px solid #aaaaaa;
        color: #606060;
        height: 1.4em;
        font-size: 90%;
    }

    .smp-page a:hover {
        background-color: #909090;
        color: #FFFFFF;
        border: 1px solid #333333;
        font-size: 90%;
    }

    .smp-page-space {
        border: 0px;
    }

    #smp-table-update-button {
        width: 70px;
    }

    #smp-table-reset-button {
        width: 70px;
    }

    tr.smp-be-operate td.smp-cell-data {
        background-color: #CCFFCC !important;
    }

    tr.smp-valid-err-row td.smp-cell-data {
        background-color: #FFF099;
    }

    .smp-valid-err-input {
        background-color: #FF9663;
    }
</style>

<body>
    task 19 use api
    <div>
        登録時にシステムが割り当てるID
        と差替わります。
        <span>
            %val:sys:id%
        </span>
    </div>
    <div>
        担当者ID
        <span>
            %val:usr:loginID%
        </span>
    </div>
    <div>
        メールアドレス
        <span>
            %val:usr:mail%
        </span>
    </div>
    <div>
        権限
        <span>
            %val:usr:authority%
        </span>
    </div>
    <div>
        企業ID
        <span>
            %val:usr:companyID%
        </span>
    </div>
    <div>
        種別
        <span>
            %val:usr:kind:id%
        </span>
    </div>
    <div>
        部署ID
        <span>
            %val:usr:department_id%
        </span>
    </div>
    <div>
        部署名
        <span>
            %val:usr:department_name%
        </span>
    </div>

    <div>
        <h2>回答リスト: 進行中</h2>
        <table id="dataAnswerStatus1" class="display">
            <thead>
                <tr>
                    <th>id</th>
                    <th>種別</th>
                    <th>回答ID</th>
                    <th>ステータス</th>
                    <th>企業ID</th>
                    <th>企業名</th>
                    <th>personID</th>
                    <th>department_id</th>
                    <th>登録日時</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <hr>
    <div>
        <h2>回答リスト: 完了</h2>
        <table id="dataAnswerStatus2" class="display">
            <thead>
                <tr>
                    <th>id</th>
                    <th>種別</th>
                    <th>回答ID</th>
                    <th>ステータス</th>
                    <th>企業ID</th>
                    <th>企業名</th>
                    <th>personID</th>
                    <th>department_id</th>
                    <th>登録日時</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <hr>
    <div>
        <h2>リレーションリスクリスト: 進行中</h2>
        <table id="dataRelationStatus1" class="display">
            <thead>
                <tr>
                    <th>id</th>
                    <th>登録日時</th>
                    <th>更新日時</th>
                    <th>リレーションリスクID</th>
                    <th>企業ID</th>
                    <th>企業名</th>
                    <th>personID</th>
                    <th>azusa_status</th>
                    <th>ステータス</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <hr>
    <div>
        <h2>リレーションリスクリスト: 完了</h2>
        <table id="dataRelationStatus2" class="display">
            <thead>
                <tr>
                    <th>id</th>
                    <th>登録日時</th>
                    <th>更新日時</th>
                    <th>リレーションリスクID</th>
                    <th>企業ID</th>
                    <th>企業名</th>
                    <th>personID</th>
                    <th>azusa_status</th>
                    <th>ステータス</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

</body>
<script src="//cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        function populateDataTable(jsonData, dataTableId) {
            var data = JSON.parse(jsonData);
            var dataTable = $('#' + dataTableId).DataTable({
                lengthMenu: [
                    [10, 25, 50, 100, -1],
                    [10, 25, 50, 100, 'All']
                ],
                columns: [{
                        data: 'id'
                    },
                    {
                        data: 'azusa_kind'
                    },
                    {
                        data: 'answerID'
                    },
                    {
                        data: 'answer_status'
                    },
                    {
                        data: 'companyID'
                    },
                    {
                        data: 'companyName'
                    },
                    {
                        data: 'personID'
                    },
                    {
                        data: 'department_id'
                    },
                    {
                        data: 'registDate'
                    }
                ]
            });

            for (var i = 0; i < data.length; i++) {
                var answer_status = data[i].answer_status == 1 ? '回答中' : '完了';
                var azusa_kind = data[i].azusa_kind == 1 ? '国内' : '監査役';
                var answerDetail = '<a href="https://ctr34.smp.ne.jp/spiral/servlet/member.parts.SettingTable?_application_id=50&_act=UseCard&_card_page_id=213177&_card_member_id=' + data[i].id + '&_card_db_id=165255">' + data[i].answerID + '</a>';
                var companyDetail = '<a href="https://ctr34.smp.ne.jp/spiral/servlet/member.parts.SettingTable?_application_id=50&_act=UseCard&_card_page_id=213179&_card_member_id=' + data[i].id + '&_card_db_id=165255">' + data[i].companyID + '</a>';

                dataTable.row.add({
                    'id': data[i].id,
                    'azusa_kind': azusa_kind,
                    'answerID': answerDetail,
                    'answer_status': answer_status,
                    'companyID': companyDetail,
                    'companyName': data[i].companyName,
                    'personID': data[i].personID,
                    'department_id': data[i].department_id,
                    'registDate': data[i].registDate
                });
            }

            dataTable.draw();
        }

        // START dataAnswerStatus1
        var jsonData1 = '<?php echo $dataAnswerStatus1; ?>';
        populateDataTable(jsonData1, 'dataAnswerStatus1');
        // END dataAnswerStatus1

        // START dataAnswerStatus2
        var jsonData2 = '<?php echo $dataAnswerStatus2; ?>';
        populateDataTable(jsonData2, 'dataAnswerStatus2');
        // END dataAnswerStatus2

        function populateDataTable2(jsonData, dataTableId) {
            var data = JSON.parse(jsonData);
            var dataTable = $('#' + dataTableId).DataTable({
                lengthMenu: [
                    [10, 25, 50, 100, -1],
                    [10, 25, 50, 100, 'All']
                ],
                columns: [{
                        data: 'id'
                    }, {
                        data: 'registDate'
                    },
                    {
                        data: 'lastupDate'
                    },
                    {
                        data: 'relationriskID'
                    },
                    {
                        data: 'companyID'
                    },
                    {
                        data: 'companyName'
                    },
                    {
                        data: 'personID'
                    },
                    {
                        data: 'azusa_status'
                    },
                    {
                        data: 'answer_status'
                    }
                ]
            });

            for (var i = 0; i < data.length; i++) {
                var answer_status = data[i].answer_status == 1 ? '回答中' : '完了';
                // var azusa_kind = data[i].azusa_kind == 1 ? '国内' : '監査役';
                var companyDetail = '<a href="https://ctr34.smp.ne.jp/spiral/servlet/member.parts.SettingTable?_application_id=50&_act=UseCard&_card_page_id=213179&_card_member_id=' + data[i].id + '&_card_db_id=165255">' + data[i].companyID + '</a>';

                dataTable.row.add({
                    'id': data[i].id,
                    'registDate': data[i].registDate,
                    'lastupDate': data[i].lastupDate,
                    'relationriskID': data[i].relationriskID,
                    'companyID': companyDetail,
                    'companyName': data[i].companyName,
                    'personID': data[i].personID,
                    'azusa_status': data[i].azusa_status,
                    'answer_status': answer_status
                });
            }

            dataTable.draw();
        }

        // START dataRelationStatus1
        var jsonData3 = '<?php echo $dataRelationStatus1; ?>';
        populateDataTable2(jsonData3, 'dataRelationStatus1');
        // END dataRelationStatus1

        // START dataRelationStatus2
        var jsonData4 = '<?php echo $dataRelationStatus2; ?>';
        populateDataTable2(jsonData4, 'dataRelationStatus2');
        // END dataRelationStatus2
    });
</script>
<html>