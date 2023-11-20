<!-- SMP_DYNAMIC_PAGE DISPLAY_ERRORS=ON NAME=SAMPLE -->
<?php
session_start();
?>
<?php
$companyId = $_GET['company_id'];

//マイエリアタイトル
$AREA_TITLE = "azusa_mypage";

// ログインするレコードの識別キー
$LOGIN_KEY = "test001";

// ログインするレコードのパスワード
$LOGIN_PWD = "test001";

// 一覧表の検索フォームのタイトル  回答一覧
$SEARCH_TITLE = "search65";

//============================================
// ■API共通
//============================================

// APIコミュニケータをセット
$api_communicator = $SPIRAL->getSpiralApiCommunicator();

//============================================
// ログイン
//============================================

// リクエストパラメータのセット
$request = new SpiralApiRequest();
$request->put("my_area_title", $AREA_TITLE);
$request->put("id", $LOGIN_KEY);
$request->put("password", $LOGIN_PWD);
$request->put("url_type", "2");

// スパイラルAPIサーバへリクエストを送信
$response = $api_communicator->request("area", "login", $request);

//============================================
// 一覧表のデータ取得
//============================================

// jsessionidの取得
if ($response->get("code") == 0) {
    $jsessionid = $response->get("jsessionid");
    $search_condition = array(
        array("name" => "companyID", "value" => $companyId),
    );

    // リクエストパラメータのセット
    $request = new SpiralApiRequest();
    $request->put("jsessionid", $jsessionid);
    $request->put("my_area_title", $AREA_TITLE);
    $request->put("search_title", $SEARCH_TITLE);
    $request->put("search_condition", $search_condition);

    // スパイラルAPIサーバへリクエストを送信
    $response = $api_communicator->request("table", "data", $request);

    $conf_data = $response->getString('data');
    // printf("\n const domDataAnswer = '%s';\n", json_encode($conf_data));
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ja">

<head>
    <meta http-equiv="Content-Style-Type" content="text/css">
    <title>企業別回答単票</title>
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

        .smp-table th {
            border: 1px solid #999999;
            padding: 5px;
            font-size: 10pt;
            font-weight: bold;
            color: #444444;
            background-color: #DCDCDE;
        }

        .smp-table td {
            border-width: 0px 1px;
            border-style: solid;
            border-color: #999999;
            padding: 5px;
            font-size: 10pt;
            color: #444444;
        }
    </style>
</head>

<body>
    <p>
        企業IDをもとに、企業IDでフィルター済みの回答一覧を表示させる。<br>
        企業IDをもとに、企業IDでフィルター済みのリレーションリスク一覧を表示させる。<br>
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
                                <td id="company-id">
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
                        <table class="smp-table" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                            <thead class="smp-row-3 smp-row-sort" style="height:20;">
                                <th class="smp-cell-sort smp-cell-3-1 smp-cell smp-cell-row-3 smp-cell-col-1" align="center">
                                    id
                                </th>
                                <th class="smp-cell-sort smp-cell-3-2 smp-cell smp-cell-row-3 smp-cell-col-2" align="center">
                                    種別
                                </th>
                                <th class="smp-cell-sort smp-cell-3-3 smp-cell smp-cell-row-3 smp-cell-col-3" align="center">
                                    回答ID
                                </th>
                                <th class="smp-cell-sort smp-cell-3-4 smp-cell smp-cell-row-3 smp-cell-col-4" align="center">
                                    ステータス
                                </th>
                                <th class="smp-cell-sort smp-cell-3-4 smp-cell smp-cell-row-3 smp-cell-col-4" align="center">
                                    企業ID
                                </th>
                                <th class="smp-cell-sort smp-cell-3-5 smp-cell smp-cell-row-3 smp-cell-col-5" align="center">
                                    企業名
                                </th>
                                <th class="smp-cell-sort smp-cell-3-4 smp-cell smp-cell-row-3 smp-cell-col-4" align="center">
                                    登録日時
                                </th>
                                <th class="smp-cell-sort smp-cell-3-5 smp-cell smp-cell-row-3 smp-cell-col-5" align="center">
                                    更新日時
                                </th>
                            </thead>
                            <tbody id="table-body">
                                <?php
                                foreach ($conf_data as $value) {
                                    echo '<tr class = "smp-row-4 smp-row-data" style = "height:20;" >
                                            <td align = "center" >' . $value[0] . '</td> 
                                            <td align = "left" >' . $value[1] . '</td> 
                                            <td align = "left" ><a href="%url/card:page_213177%"> ' . $value[2] . '</a>  </td> 
                                            <td align = "left" >' . $value[3] . '</td>
                                            <td align = "left" ><a href="%url/card:page_213179%&company_id=%val:usr:companyID%">' . $value[4] . '</a> </td>
                                            <td align = "left" >' . $value[5] . '</td> 
                                            <td align = "left" >' . $value[6] . '</td> 
                                            <td align = "left" >' . $value[7]  . '</td> 
                                        </tr>';
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</body>
<script>
    const companyID = document.getElementById("company-id")
    const urlParams = new URLSearchParams(window.location.search);
    const paramCompanyId = urlParams.get('company_id');
    const tbodyElement = document.getElementById("table-body")

    if (companyID.innerText != paramCompanyId) {
        tbodyElement.remove()
    }
</script>

</html>