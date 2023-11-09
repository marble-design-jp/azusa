<!-- SMP_DYNAMIC_PAGE DISPLAY_ERRORS=ON NAME=SAMPLE -->
<?php
session_start();
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
                        <a href="%url/table:back%" onclick="deleteCache(event)">一覧表に戻る</a>
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
                    <div class="whole" align="center">
                        <table id="table-body">
                            <tr>
                                <td class="" align=" center">
                                    %sf:usr:search65:table%
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
    const companyID = document.getElementById("company-id")
    const urlParams = new URLSearchParams(window.location.search);
    const paramCompanyId = urlParams.get('company_id');
    const tbodyElement = document.getElementById("table-body")

    if (companyID.innerText != paramCompanyId) {
        tbodyElement.remove()
    }

    function deleteCache(event) {
        const url = new URL(event.target.href);
        const urlParams = url.searchParams;
        urlParams.set('table_cache', 'false');
        event.target.href = url.toString();
    }
</script>

</html>