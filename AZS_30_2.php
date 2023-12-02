<!-- SMP_DYNAMIC_PAGE DISPLAY_ERRORS=ON NAME=SAMPLE -->
<?php
session_start();

$api_token = '00002Gfk8qj552778b3985bc5b3f89880778dcfcdf6ea3c23634';
$api_token_secret = '2b5fc9215448a5d6a889c5acda783de7acb22865';
$SPIRAL->setApiToken($api_token, $api_token_secret);
$api_communicator = $SPIRAL->getSpiralApiCommunicator();
$passkey = time();
$key = $api_token . '&' . $passkey;
$signature = hash_hmac('sha1', $key, $api_token_secret, false);

// 回答（アクションプラン）10DB
$db_title = 'actionplan10DB';
$columns =  [
    'answer_ID',
    'pnt_2e4',
    'act_2e4',
    'pnt_serv2e5-1',
    'act_serv2e5-1',
    'pnt_firm2e5-1',
    'act_firm2e5-1',
    'pnt_reason2e5-1',
    'act_reason2e5-1',
    'pnt_serv2e5-2',
    'act_serv2e5-2',
    'pnt_firm2e5-2',
    'act_firm2e5-2',
    'pnt_reason2e5-2',
    'ac_10ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）11DB
$db_title = 'actionplan11DB';
$columns =  [
    'answer_ID',
    'act_reason2e5-2',
    'pnt_serv2e5-3',
    'act_serv2e5-3',
    'pnt_firm2e5-3',
    'act_firm2e5-3',
    'pnt_reason2e5-3',
    'act_reason2e5-3',
    'pnt_2f1',
    'act_2f1',
    'pnt_2f2',
    'act_2f2',
    'pnt_2f3',
    'act_2f3',
    'ac_11ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）12DB
$db_title = 'actionplan12DB';
$columns =  [
    'answer_ID',
    'pnt_2f4',
    'act_2f4',
    'pnt_2f5',
    'act_2f5',
    'pnt_2g1',
    'act_2g1',
    'pnt_2g2',
    'act_2g2',
    'pnt_3a1',
    'typ_3a1',
    'pnt_3a2',
    'typ_3a2',
    'pnt_3a3',
    'act_3a3',
    'pnt_3a4',
    'typ_3a4',
    'pnt_3a5',
    'typ_3a5',
    'ac_12ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）13DB
$db_title = 'actionplan13DB';
$columns =  [
    'answer_ID',
    'pnt_3a6',
    'typ_3a6',
    'pnt_3a7',
    'typ_3a7',
    'pnt_3a8',
    'type_3a8',
    'pnt_3b1',
    'typ_3b1',
    'pnt_3b2',
    'typ_3b2',
    'pnt_3b3',
    'typ_3b3',
    'pnt_3b4',
    'typ_3b4',
    'pnt_3b5',
    'typ_3b5',
    'pnt_3b6',
    'typ_3b6',
    'pnt_3b7',
    'typ_3b7',
    'pnt_3c1',
    'typ_3c1',
    'pnt_3c2',
    'typ_3c2',
    'pnt_country3c2',
    'typ_country3c2-1',
    'ac_13ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）14DB
$db_title = 'actionplan14DB';
$columns =  [
    'answer_ID',
    'pnt_comp3c2-2',
    'typ_comp3c2-2',
    'pnt_country3c2',
    'typ_eval3c2-2',
    'pnt_country3c2-3',
    'typ_country3c2-3',
    'pnt_comp3c2-3',
    'typ_comp3c2-3',
    'pnt_eval3c2-3',
    'typ_eval3c2-3',
    'pnt_country3c2-4',
    'typ_country3c2-4',
    'pnt_comp3c2-4',
    'typ_comp3c2-4',
    'pnt_eval3c2-4',
    'typ_eval3c2-4',
    'pnt_3c3',
    'typ_3c3',
    'pnt_3c4',
    'typ_3c4',
    'pnt_3c5',
    'typ_3c5',
    'pnt_3c6',
    'typ_3c6',
    'pnt_3c7',
    'typ_3c7',
    'ac_14ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）15DB
$db_title = 'actionplan15DB';
$columns =  [
    'answer_ID',
    'pnt_3d1',
    'typ_3d1',
    'pnt_3d2',
    'typ_3d2',
    'pnt_3d3',
    'typ_3d3',
    'pnt_3d4',
    'typ_3d4',
    'pnt_3d5',
    'typ_3d5',
    'pnt_firm3d5-1',
    'typ_firm3d5-1',
    'pnt_firmna3d5-1',
    'pnt_firmna3d5-1',
    'pnt_firmser3d5-1',
    'typ_firmser3d5-1',
    'pnt_3d5-1',
    'typ_3d5-1',
    'pnt_firm3d5-2',
    'typ_firm3d5-2',
    'pnt_firmna3d5-3',
    'typ_firmna3d5-3',
    'pnt_firm3d5-4',
    'typ_firm3d5-4',
    'pnt_3d5-2',
    'typ_3d5-2',
    'ac_15ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）16DB
$db_title = 'actionplan16DB';
$columns =  [
    'answer_ID',
    'pnt_3e1',
    'typ_3e1',
    'pnt_3e2',
    'typ_3e2',
    'pnt_3e3',
    'typ_3e3',
    'pnt_3e4',
    'typ_3e4',
    'pnt_serv3e5-1',
    'typ_serv3e5-1',
    'pnt_firm3e5-1',
    'typ_firm3e5-1',
    'pnt_reason3e5-1',
    'typ_reason3e5-1',
    'pnt_firm3e5-2',
    'typ_firm3e5-2',
    'pnt_reason3e5-2',
    'typ_reason3e5-2',
    'pnt_serv3e5-3',
    'typ_serv3e5-3',
    'pnt_firm3e5-3',
    'typ_firm3e5-3',
    'pnt_reason3e5-3',
    'typ_reason3e5-3',
    'pnt_3e5',
    'typ_3e5',
    'ac_16ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）17DB
$db_title = 'actionplan17DB';
$columns =  [
    'answer_ID',
    'pnt_3f1',
    'typ_3f1',
    'pnt_3f2',
    'typ_3f2',
    'pnt_3f3',
    'typ_3f3',
    'pnt_3f4',
    'typ_3f4',
    'pnt_3f5',
    'typ_3f5',
    'pnt_3g1',
    'typ_3g1',
    'pnt_3g2',
    'typ_3g2',
    'pnt_4c',
    'typ_4c',
    'pnt_4d5',
    'typ_4d5',
    'pnt_4d7',
    'typ_4d7',
    'pnt_4d',
    'typ_4d',
    'pnt_4e5',
    'typ_4e5',
    'pnt_4e',
    'typ_4e',
    'ac_17ID9',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}

// 回答（アクションプラン）18DB
$db_title = 'actionplan18DB';
$columns =  [
    'answer_ID',
    'pnt_4f',
    'typ_4f',
    'pnt_4g',
    'typ_4g',
    'pnt_4g2',
    'typ_4g2',
    'class_5-1',
    'class_5-2',
    'class_5-3',
    'pnt_5-1',
    'pnt_5-2',
    'pnt_5-3',
    'typ_5-1',
    'typ_5-2',
    'typ_5-3',
    'comment_6',
    'handover',
    'year',
    'ac_18ID',
];
$request = new SpiralApiRequest();
$request->put("spiral_api_token", $api_token);
$request->put("Content-Type", 'application/json; charset=UTF-8');
$request->put("passkey", $passkey);
$request->put("select_columns", $$columns);
$request->put("db_title", $db_title);
$request->put("signature", $signature);

$response = $api_communicator->request("database", "select", $request);
$conf_data = count($response->getString('data')) >= 2 ? $response->getString('data')[1] : [];
$label = $response->getString('label');
$label = array_combine($columns, $label);
if (!empty($conf_data)) {
    $conf_data = array_combine($columns, $conf_data);
    foreach ($conf_data as $key => $value) {
        if (isset($label[$key]->{$value})) {
            $conf_data[$key . "_text"] = $label[$key]->{$value};
        }
    }
}
