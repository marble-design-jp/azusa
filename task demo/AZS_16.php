<html>

<head>
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

    <table align="center">
        <tr>
            <td>
                <div class="mainBody">
                    <div class="whole" align="center">
                        <table id="table-body">
                            <tr>
                                <td class="" align=" center">
                                    %sf:usr:search65%
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
</script>
<html>