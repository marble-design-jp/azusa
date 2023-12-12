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

if (isset($_GET['send']) && $_GET['send'] == 1) {
    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("signature", $signature);
    $request->put("passkey", $passkey);
    $request->put("rule_id", "5805763");
    $request->put("id", $_GET['usr_id']);
    $response = $api_communicator->request("deliver_thanks", "send", $request);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form method="post">
        <input type="text" name="usr_id">
        <input type="hidden" name="send" value="1">
        <input type="submit" value="Send Mail">
    </form>
</body>
<script>
    <?
    if (isset($_GET['send']) && $_GET['send'] == 1) {
        if ($response->get("code") == 0) {
            echo "alert('deliver_thanks/send 正常終了');";
        } else {
            echo "alert('deliver_thanks/send エラーが発生しました。');";
        }
    }
    ?>
</script>

</html>