<!-- SMP_DYNAMIC_PAGE DISPLAY_ERRORS=ON NAME=SAMPLE -->
<?php
session_start();

$api_token = '00002G97njC006ea9dd670bcae85361cc649c9e1e1a1fd56bb0d';
$api_token_secret = '49f9ca121d13bc0056ebe072273768e4e7488212';
$SPIRAL->setApiToken($api_token, $api_token_secret);
$api_communicator = $SPIRAL->getSpiralApiCommunicator();
$passkey = time();
$key = $api_token . '&' . $passkey;
$signature = hash_hmac('sha1', $key, $api_token_secret, false);

// delete data
$db_title = 'azusa_im_ansaDB';
if (!empty($_GET['bulk_delete'])) {
    $checks = $_GET['check[]'] ?? '';
    if (!empty($checks)) {
        if (is_array($checks)) {
            $search_condition = [];
            foreach ($checks as $value) {
                $new_condition = array('name' => 'answer_id', 'value' => $value, 'operator' => '=', 'logical_connection' => 'or');
                array_push($search_condition, $new_condition);
            }
        } else $search_condition = array(array('name' => 'answer_id', 'value' => $checks));

        // $search_condition = array(
        //     array('name' => 'answer_id', 'value' => '123'),
        // );

        // $number_of_elements = 200;

        // for ($i = 0; $i < $number_of_elements; $i++) {
        //     $value = $i + 1;
        //     $new_condition = array('name' => 'answer_id', 'value' => $value, 'operator' => '=', 'logical_connection' => 'or');
        //     array_push($search_condition, $new_condition);
        // }

        // get api 登録用DB
        $request = new SpiralApiRequest();
        $request->put("spiral_api_token", $api_token);
        $request->put("Content-Type", 'application/json; charset=UTF-8');
        $request->put("passkey", $passkey);
        $request->put("db_title", $db_title);
        $request->put("signature", $signature);
        $request->put("search_condition", $search_condition);

        $response = $api_communicator->request("database", "delete", $request);
        $ok = false;
        if ($response->code == 0) {
            $ok = true;
        }
    }
}

// get data
$db_title = 'azusa_im_ansaDB';

$columns =  [
    'answer_id',
];
// get api 登録用DB
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title);
$request->put("signature", $signature);
$request->put("select_columns", $columns);
// $request->put("search_condition", $search_condition);

$response = $api_communicator->request("database", "select", $request);
$conf_data = $response->getString('data');

$countColumns = count($columns);
foreach ($conf_data as &$src) {
    $src = array_combine($columns, $src);
}
?>
<!DOCTYPE html>
<html id="SMP_STYLE">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=shift_jis">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Test Delete</title>
</head>

<body>
    <h1>Test Delete</h1>
    <form action="" method="post">
        <? foreach ($conf_data as $data) { ?>
            <input type="checkbox" name="check[]" value="<? echo $data['answer_id'] ?>"><? echo $data['answer_id'] ?><br>
        <? } ?>
        <button type="submit" name="bulk_delete" value="bulk_delete">Bulk delete</button>
    </form>
</body>
<script>
    <? if (!empty($_GET['bulk_delete']) && $ok) {
        echo "alert('Deleted data');";
    } ?>
</script>

</html>