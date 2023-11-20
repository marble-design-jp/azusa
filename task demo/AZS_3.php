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
$db_title_A = 'azusa_answerADB';
$db_title_B = 'azusa_answerBDB';
$answerId = $_POST['answerID'] ?? $_GET['answer'];

$search_condition = array(
    array("name" => "answerID", "value" => $answerId),
);

if ($_POST["submit-form"] == "1") {
    // API UPDATE Master answer DB
    $dataUpdate = array(
        array("name" => "lastupDate", "value" => "now"),
    );

    // $search_condition = array(
    //     array("name" => "answerID", "value" => $answerId),
    // );

    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("passkey", $passkey);
    $request->put("db_title", $db_title);
    $request->put("signature", $signature);
    $request->put("data", $dataUpdate);
    $request->put("search_condition", $search_condition);

    $response = $api_communicator->request("database", "update", $request);

    // API UPDATE answer ADB
    $dataUpdateA = array(
        array("name" => "answerA1_reason", "value" => $_POST['answerA1_reason']),
        array("name" => "answerA1_improve", "value" => $_POST['answerA1_improve']),
        array("name" => "answerA2_reason", "value" => $_POST['answerA2_reason']),
        array("name" => "answerA2_improve", "value" => $_POST['answerA2_reason']),
    );

    // $search_condition = array(
    //     array("name" => "answerID", "value" => $answerId),
    // );

    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("passkey", $passkey);
    $request->put("db_title", $db_title_A);
    $request->put("signature", $signature);
    $request->put("data", $dataUpdateA);
    $request->put("search_condition", $search_condition);

    $response = $api_communicator->request("database", "update", $request);

    // API UPDATE answer BDB
    $dataUpdateB = array(
        array("name" => "answerB1_reason", "value" => $_POST['answerB1_reason']),
        array("name" => "answerB1_improve", "value" => $_POST['answerB1_improve']),
        array("name" => "answerB2_reason", "value" => $_POST['answerB2_reason']),
        array("name" => "answerB2_improve", "value" => $_POST['answerB2_reason']),
    );

    // $search_condition = array(
    //     array("name" => "answerID", "value" => $answerId),
    // );

    $request = new SpiralApiRequest();
    $request->put("spiral_api_token", $api_token);
    $request->put("Content-Type", 'application/json; charset=UTF-8');
    $request->put("passkey", $passkey);
    $request->put("db_title", $db_title_B);
    $request->put("signature", $signature);
    $request->put("data", $dataUpdateB);
    $request->put("search_condition", $search_condition);

    $response = $api_communicator->request("database", "update", $request);
}
// get data answer ADB
$columns_A =  [
    'answerA1_reason',
    'answerA1_improve',
    'answerA2_reason',
    'answerA2_improve'
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title_A);
$request->put("signature", $signature);
$request->put("search_condition", $search_condition);
$request->put("select_columns", $columns_A);

$response_A = $api_communicator->request("database", "select", $request);
$conf_data_A = $response_A->getString('data');

$countColumns = count($columns_A);
foreach ($conf_data_A as &$src) {
    $countSrc = count($src);
    for ($i = 0; ($i < $countSrc && $i < $countColumns); $i++) {
        $key = $columns_A[$i];
        $src["$key"] = $src[$i];
    }
}
$dataA = $conf_data_A[0];
// get data answer BDB
$columns_B =  [
    'answerB1_reason',
    'answerB1_improve',
    'answerB2_reason',
    'answerB2_improve'
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("db_title", $db_title_B);
$request->put("signature", $signature);
$request->put("search_condition", $search_condition);
$request->put("select_columns", $columns_B);

$response_B = $api_communicator->request("database", "select", $request);
$conf_data_B = $response_B->getString('data');

$countColumns = count($columns_B);
foreach ($conf_data_B as &$src) {
    $countSrc = count($src);
    for ($i = 0; ($i < $countSrc && $i < $countColumns); $i++) {
        $key = $columns_B[$i];
        $src["$key"] = $src[$i];
    }
}
$dataB = $conf_data_B[0];
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ja">

<head>
    <meta http-equiv="Content-Style-Type" content="text/css">
    <title>回答更新単票</title>
    <style type="text/css">
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
            border-width: 0 1 0 1;
            border-style: solid;
            border-color: #F0F0F0;
        }

        body {
            background-color: #E7E6DA;
            padding: 0px;
        }

        .whole {
            padding: 20px;
            text-align: center;
        }

        .table-input,
        .table-input input {
            width: 100%;
        }
    </style>
</head>

<body>
    <p>
        回答IDをもとに、回答者マスタDB、回答者設問A、回答者設問Bに登録されている情報を表示する。<br>
        回答IDをもとに、各DBの各フィールドに更新する。<br>
    </p>

    <table align="center">
        <tr>
            <td>
                <div class="mainBody">
                    <div class="whole">
                        <table class="smp-card-list">
                            <tr>
                                <th>
                                    登録日時
                                </th>
                                <td>
                                    %val:usr:registDate%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    更新日時
                                </th>
                                <td>
                                    %val:usr:lastupDate%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    回答ID
                                </th>
                                <td>
                                    %val:usr:answerID%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    企業ID
                                </th>
                                <td>
                                    %val:usr:companyID%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    企業名
                                </th>
                                <td>
                                    %val:usr:companyName%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    回答者ID
                                </th>
                                <td>
                                    %val:usr:personID%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    回答者名
                                </th>
                                <td>
                                    %val:usr:personName%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    ステータス
                                </th>
                                <td>
                                    %val:usr:azusa_status%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    種別
                                </th>
                                <td>
                                    %val:usr:azusa_kind%
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    年月
                                </th>
                                <td>
                                    %val:usr:date%
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="text-align:center;">
                        <a href="%url/table:back%">一覧表に戻る</a>
                    </div>
                    <div style="margin-top:15px;" align="center">
                        <table style="width:550px;margin:0;background-color:#ffffff;border:1px solid #cccccc">
                            <tr>
                                <td style="font-size:11px;padding:5px;">このページは、当社が契約する<a href="https://www.spiral-platform.co.jp/" target="_blank" title="スパイラル株式会社">スパイラル株式会社</a>の情報管理システム「スパイラル バージョン1」が表示しています。
                                </td>
                                <td style="padding:5px;">
                                    <script type="text/javascript" src="https://reg34.smp.ne.jp/spiral/servlet/seal.Seal?_act=GetJS&version=2&sid=4D8d74nhoa&type=page&size=m&lang=ja"></script>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="margin-top:15px;" align="center">
                        <form method="POST" accept-charset="shift_jis">
                            <table class="smp-card-list table-input">
                                <tr>
                                    <th>
                                        フィールド名
                                    </th>
                                    <td>
                                        テキスト入力
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答A1_現状分析、低評価の理由
                                    </th>
                                    <td>
                                        <input type="text" name="answerA1_reason" value="<?php echo $dataA['answerA1_reason'] ?>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答A1_今後の対応、改善策など
                                    </th>
                                    <td>
                                        <input type="text" name="answerA1_improve" value="<?php echo $dataA['answerA1_improve'] ?>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答A2_現状分析、低評価の理由
                                    </th>
                                    <td>
                                        <input type="text" name="answerA2_reason" value="<?php echo $dataA['answerA2_reason'] ?>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答A2_今後の対応、改善策など
                                    </th>
                                    <td>
                                        <input type="text" name="answerA2_improve" value="<?php echo $dataA['answerA2_improve'] ?>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答B1_現状分析、低評価の理由
                                    </th>
                                    <td>
                                        <input type="text" name="answerB1_reason" value="<?php echo $dataB['answerB1_reason'] ?>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答B1_今後の対応、改善策など
                                    </th>
                                    <td>
                                        <input type="text" name="answerB1_improve" value="<?php echo $dataB['answerB1_improve'] ?>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答B2_現状分析、低評価の理由
                                    </th>
                                    <td>
                                        <input type="text" name="answerB2_reason" value="<?php echo $dataB['answerB2_reason'] ?>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        回答B2_今後の対応、改善策など
                                    </th>
                                    <td>
                                        <input type="text" name="answerB2_improve" value="<?php echo $dataB['answerB2_improve'] ?>">
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" name="submit-form" value="1">
                            <input type="hidden" name="answerID" value="%val:usr:answerID%">
                            <input style="margin-top:15px;" type="submit" value="更新">
                        </form>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</body>

</html>