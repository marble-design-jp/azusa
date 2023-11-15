<!-- SMP_DYNAMIC_PAGE DISPLAY_ERRORS=ON NAME=SAMPLE -->
<?php
session_start();
?>
<html>

<head>
</head>

<body>
    <p>
        ↓権限：管理者・営業担当者どちらでログインしても表示<br>
        <br>
        <a href="%url/rel:mpgt:page_213174%">回答リスト</a>
    </p>
    <br>
    <br>
    <?php
    if ($SPIRAL->getContextByFieldTitle("authority") == 2) {
        echo "<div style='display: none'>";
    }
    ?>

    <p>
        ↓権限：管理者でログインした時のみ表示<br>
        <br>
        〇〇ボタン<br>
    </p>

    <?php
    if ($SPIRAL->getContextByFieldTitle("authority") == 2) {
        echo "</div>";
    }
    ?>

    <p>
        ↓特定の会社名で抽出（検索）済みの一覧表と検索を表示させる<nr>
            <br>
            <a href="%url/rel:mpgt:ichiran_kensaku%&45652_4379887_1=%val:usr:companyID%">特定リスト</a><br>
    </p>
    <p>
        ↓Task 16<br>
        <?php
        if ($SPIRAL->getContextByFieldTitle("kind") == 1) {
            echo '<a href="%url/rel:mpgt:azusa_task16%">Admin</a><br>';
        }
        if ($SPIRAL->getContextByFieldTitle("kind") == 2) {
            echo '<a href="%url/rel:mpgt:azusa_task16%&45652_4401765_1=%val:usr:department_id%">Coorporate</a><br>';
        }
        if ($SPIRAL->getContextByFieldTitle("kind") == 3) {
            echo "<a href='%url/rel:mpgt:azusa_task16%&45652_4414151_1=%val:usr:loginID%'>User</a><br>";
        }
        ?>
    </p>
    <p>
        ↓Task 19<br>
        <?php
        if ($SPIRAL->getContextByFieldTitle("kind") == 1) {
            echo '<a href="%url/rel:mpgt:task19%">Admin</a><br>';	

        }
        if ($SPIRAL->getContextByFieldTitle("kind") == 2) {
            echo '<a href="%url/rel:mpgt:task19%&45652_4401765_1=%val:usr:department_id%">Coorporate</a><br>';
        }
        if ($SPIRAL->getContextByFieldTitle("kind") == 3) {
            echo "<a href='%url/rel:mpgt:task19%&45652_4414151_1=%val:usr:loginID%&46095_4414161_1=%val:usr:department_id%'>User</a><br>";
        }
        ?>
    </p>
    <p>
        ↓Task 19 api<br>
        <a href="%url/rel:mpgt:task19_api%">%val:usr:loginID%</a><br>
    </p>
    <p>
        ↓Task 63<br>
        <?php
        if ($SPIRAL->getContextByFieldTitle("kind") == 1) {
            echo '<a href="%url/rel:mpgt:AZS_63%">Admin</a><br>';	

        }
        if ($SPIRAL->getContextByFieldTitle("kind") == 2) {
            echo '<a href="%url/rel:mpgt:AZS_63%&46265_4401765_1=%val:usr:department_id%&46266_4401765_1=%val:usr:department_id%&46267_4414161_1=%val:usr:department_id%&46268_4414161_1=%val:usr:department_id%">Coorporate</a><br>';
        }
        if ($SPIRAL->getContextByFieldTitle("kind") == 3) {
            echo "<a href='%url/rel:mpgt:AZS_63%&46265_4414151_1=%val:usr:loginID%&46266_4414151_1=%val:usr:loginID%&46267_4414174_1=%val:usr:loginID%&46268_4414174_1=%val:usr:loginID%'>User</a><br>";
        }
        ?>
    </p>
</body>

</html>