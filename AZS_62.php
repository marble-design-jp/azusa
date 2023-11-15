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

$db_title = 'azusa_importDB';

$columns =  [
    'company_id',
    'company_name',
    'person_id',
    'person_name',
    'answer_id',
    'fiscalyear',
    'answer_date',
];
$search_condition = array(
    array('name' => 'company_id', 'value' => $SPIRAL->getContextByFieldTitle('companyID'))
);
// get api 登録用DB
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title);
$request->put("signature", $signature);
$request->put("select_columns", $columns);
$request->put("search_condition", $search_condition);

$response = $api_communicator->request("database", "select", $request);
$conf_data = $response->getString('data');

// $countColumns = count($columns);
foreach ($conf_data as &$src) {
    $src = array_combine($columns, $src);
}

if ($_POST["submit-form"] == "1") {
    $originData = $conf_data[0];

    // API UPDATE azusa_im_compDB
    $db_title = 'azusa_im_compDB';
    $keyUpdate = 'company_id';
    $dataUpdate = array(
        array("name" => "company_id", "value" => $originData['company_id']),
        array("name" => "company_name", "value" => $originData['company_name']),
    );

    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("passkey", $passkey);
    $request->put("key", $keyUpdate);
    $request->put("db_title", $db_title);
    $request->put("signature", $signature);
    $request->put("data", $dataUpdate);

    $response = $api_communicator->request("database", "upsert", $request);

    // API UPDATE azusa_im_persDB
    $db_title = 'azusa_im_persDB';
    $keyUpdate = 'company_id';
    $dataUpdate = array(
        array("name" => "company_id", "value" => $originData['company_id']),
        array("name" => "company_name", "value" => $originData['company_name']),
        array("name" => "person_id", "value" => $originData['person_id']),
        array("name" => "person_name", "value" => $originData['person_name']),
    );

    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("passkey", $passkey);
    $request->put("key", $keyUpdate);
    $request->put("db_title", $db_title);
    $request->put("signature", $signature);
    $request->put("data", $dataUpdate);

    $response = $api_communicator->request("database", "upsert", $request);

    // API UPDATE azusa_im_ansaDB
    $db_title = 'azusa_im_ansaDB';
    $keyUpdate = 'answer_id';
    $dataUpdate = array(
        array("name" => "answer_id", "value" => $originData['answer_id']),
    );

    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("passkey", $passkey);
    $request->put("key", $keyUpdate);
    $request->put("db_title", $db_title);
    $request->put("signature", $signature);
    $request->put("data", $dataUpdate);

    $response = $api_communicator->request("database", "upsert", $request);

    // API UPDATE azusa_im_answDB
    $db_title = 'azusa_im_answDB';
    $keyUpdate = 'company_id';
    $dataUpdate = array(
        array("name" => "company_id", "value" => $originData['company_id']),
        array("name" => "company_name", "value" => $originData['company_name']),
        array("name" => "person_id", "value" => $originData['person_id']),
        array("name" => "person_name", "value" => $originData['person_name']),
        array("name" => "answer_id", "value" => $originData['answer_id']),
        array("name" => "fiscalyear", "value" => $originData['fiscalyear']),
        array("name" => "answer_date", "value" => $originData['answer_date']),
    );

    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("passkey", $passkey);
    $request->put("key", $keyUpdate);
    $request->put("db_title", $db_title);
    $request->put("signature", $signature);
    $request->put("data", $dataUpdate);

    $response = $api_communicator->request("database", "upsert", $request);
    var_dump($response);
}

?>
<html>

<head>
</head>
<style>

</style>

<body>
    <form method="PUT">
        <div>
            担当者ID:%val:usr:loginID%
        </div>
        <div>
            メールアドレス:%val:usr:email%
        </div>
        <div>
            企業ID:%val:usr:companyID%
        </div>
        <input type="hidden" name="submit-form" value="1">
        <input type="hidden" name="MyPageID" value="<? echo $_GET['MyPageID'] ?>">
        <input style="margin-top:15px;" type="submit" value="取り込み">
    </form>
</body>
<html>