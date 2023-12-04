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
$request->put("lines_per_page", 1);
$request->put("search_condition", $search_condition_answer_1);
$request->put("labels_target", "all");

$response = $api_communicator->request("database", "select", $request);
$conf_data = $response->getString('data');
$conf_label = $response->getString('label');
$filteredArray = array_filter($conf_label, function ($obj) {
    return (bool) get_object_vars($obj);
});
$labelConvertedArray = [];
foreach ($filteredArray as $key => $obj) {
    $labelConvertedArray[$key] = json_decode(json_encode($obj), true);
}
foreach ($conf_data as &$item) {
    $value = $item[5];
    if (isset($labelConvertedArray[5][$value])) {
        $item[5] = $labelConvertedArray[5][$value];
    }
    $value2 = $item[7];
    if (isset($labelConvertedArray[5][$value2])) {
        $item[7] = $labelConvertedArray[5][$value2];
    }
}

// $countColumns = count($columns);
foreach ($conf_data as &$src) {
    $src = array_combine($columns, $src);
}
$dataAnswerStatus1 = json_encode($conf_data);
$thankyou = false;
if (isset($_POST["answerID"])) {
    $answerID = $_POST["answerID"];
    $companyID = $_POST["companyID"];
    $companyName = $_POST["companyName"];

    // API UPDATE azusa_im_compDB
    $db_title = 'azusa_answerDB';
    $keyUpdate = 'answerID';
    $dataUpdate = array(
        array("name" => "answerID", "value" => $answerID),
        array("name" => "companyID", "value" => $companyID),
        array("name" => "companyName", "value" => $companyName),
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
    $thankyou = true;
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ja">

<head>
    <meta http-equiv="Content-Style-Type" content="text/css">
    <title>回答表示単票</title>
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

        .d_none,
        input.d_none {
            display: none;
        }
    </style>
</head>

<body>
    <p>
        <a href="%url/card:page_213178%&answer=%val:usr:answerID%" target="_blank">回答する</a>
    </p>
    <!--<p>
<a href="%url/rel:mpgt:azusa_task30%&answer=%val:usr:answerID%" target="_blank">回答する_task_30</a>
</p>-->
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
                        <a href="%url/table:back%" onclick="deleteCache(event)">一覧表に戻る</a>
                    </div>
                    <h1>アンケート回答入力<span>Questionnaire Comment</span>(<span class="page_number">1</span>/3)</h1>
                    <div class="wrapper_page" data-page="1">
                        <form id="form_submit" action="" method="POST">
                            <? foreach (json_decode($dataAnswerStatus1) as $item) { ?>
                                <label for="answerID">answerID</label>
                                <input id="answerID" name="answerID" type="text" value="<? echo $item->answerID ?>"><br>
                                <label for="companyID">Company ID</label>
                                <input id="companyID" name="companyID" type="text" value="<? echo $item->companyID ?>"><br>
                                <label for="companyName">Company Name</label>
                                <input id="companyName" name="companyName" type="text" value="<? echo $item->companyName ?>"><br>
                            <? } ?>
                        </form>
                    </div>
                    <div class="wrapper_page" data-page="2">
                        <table>
                            <tr>
                                <td>answerID</td>
                                <td id="answerID_conf"></td>
                            </tr>
                            <tr>
                                <td>Company ID</td>
                                <td id="companyID_conf"></td>
                            </tr>
                            <tr>
                                <td>Company Name</td>
                                <td id="companyName_conf"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="wrapper_page" data-page="3">
                        <p>thank you</p>
                    </div>
                    <div class="wrapper_btn_step_other">
                        <input class="btn_back" type="button" value="Back" onclick="previousStep()">
                        <input class="btn_line2 btn_next" type="button" value="Next" onclick="nextStep()">
                        <input class="btn_line2 btn_submit" type="submit" value="Submit Confirm" onclick="submitForm()">
                    </div>
                    <div class="wrapper_btn_step_1">
                        <p class="t_center mt50">
                            <input class="btn_line2" type="button" value="Next" onclick="nextStep()">
                        </p>
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
                </div>
            </td>
        </tr>
    </table>
</body>
<script>
    let step = <? echo $thankyou == true ? 3 : 1; ?>;
    const page_number = document.querySelector('.page_number');
    const btn_next = document.querySelector('.btn_next');
    const btn_back = document.querySelector('.btn_back');
    const btn_submit = document.querySelector('.btn_submit');
    const wrapper_btn_step_1 = document.querySelector('.wrapper_btn_step_1');
    const wrapper_btn_step_other = document.querySelector('.wrapper_btn_step_other');
    const pages = document.querySelectorAll('.wrapper_page');
    changePage();

    function deleteCache(event) {
        const url = new URL(event.target.href);
        const urlParams = url.searchParams;
        urlParams.set('table_cache', 'false');
        event.target.href = url.toString();
    }

    function changePage() {
        page_number.innerText = step;
        pages.forEach((item) => {
            if (item.getAttribute('data-page') == step) {
                item.classList.remove('d_none');
            } else {
                item.classList.add('d_none');
            }
        })
        if (step === 1) {
            wrapper_btn_step_1.classList.remove('d_none');
            wrapper_btn_step_other.classList.add('d_none');
        } else {
            wrapper_btn_step_other.classList.remove('d_none');
            wrapper_btn_step_1.classList.add('d_none');
            if (step !== 2) {
                btn_submit.classList.add('d_none');
                btn_next.classList.add('d_none');
                btn_back.classList.add('d_none');
            } else {
                btn_submit.classList.remove('d_none');
                btn_next.classList.add('d_none');
            }
        }
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    function nextStep() {
        step += 1;
        changePage()
        var form = document.querySelector("#form_submit");
        object = {};
        new FormData(form).forEach(function(value, key) {
            object[key] = value;
        });
        var answerIDView = document.getElementById("answerID_conf");
        var companyIDView = document.getElementById("companyID_conf");
        var companyNameView = document.getElementById("companyName_conf");
        answerIDView.textContent = object.answerID;
        companyIDView.textContent = object.companyID;
        companyNameView.textContent = object.companyName;
    }

    function previousStep() {
        step -= 1;
        changePage();
    }

    function submitForm() {
        // Prevent the default form submission
        event.preventDefault();
        document.querySelector("#form_submit").submit();
    }
</script>

</html>