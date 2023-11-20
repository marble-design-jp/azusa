<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ja">

<head>
    <meta http-equiv="Content-Style-Type" content="text/css">
    <title>新しい単票(61)</title>
    <style type="text/css">
        <!--
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
        -->
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
                </div>
            </td>
        </tr>
    </table>
</body>

</html>