<?php
session_start();

$banknotesATM = array(500=>0, 200=>0, 100=>0, 50=>0, 20=>0, 10=>0, 5=>0);
$totalCashATM = 0;

echo "Banknotes in ATM:";
echo "<br>";

if (file_exists("data.json")) {
    $handle = fopen('data.json', 'rb');
    $str = fread($handle, filesize('data.json'));
    fclose($handle);
    $banknotesATM = json_decode($str,true);
    foreach ($banknotesATM as $key => $value) {
        $totalCashATM += $key * $value;
        echo "Banknote: $$key, amount: $value";
        echo "<br>";
    }
}
else {
    $handle = fopen('data.json', 'wb');

    foreach ($banknotesATM as $key => $value){
        $amountBills = rand(0, 5);
        $banknotesATM[$key] = $amountBills;
        $totalCashATM += $key * $amountBills;
        echo "Banknote: $$key, amount: $amountBills";
        echo "<br>";
    }

    $dataWrite = json_encode($banknotesATM, true);
    fwrite($handle, $dataWrite);
    fclose($handle);
}


echo "<br>";
echo "Total cash in ATM: $totalCashATM";
echo "<br>";
echo "<br>";

$_SESSION['$banknotesATM'] = $banknotesATM;
$_SESSION['$totalCashATM'] = $totalCashATM;


echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <title>cash machine</title>
</head>
<body>

<form action=\"helper.php\" method=\"post\">
    <input type=\"text\" name=\"money\">
    <button type=\"submit\">Get cash</button>
</form>

</body>
</html>";


