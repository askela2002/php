<?php
session_start();

$banknotesATM = $_SESSION['$banknotesATM'];
$totalCashATM = $_SESSION['$totalCashATM'];

$cashGive = $banknotesATM;

$askedMoney = $_POST['money'];
$money = $askedMoney;

if (filter_var($askedMoney, FILTER_VALIDATE_INT) === false) {
    echo "The amount is wrong! Try to change amount!";
    echo "<br>";
    echo "<a href='index.php'>Main page</a>";
    exit();
} else {
    if ($askedMoney > $totalCashATM) {
        echo "Cash asked: {$askedMoney}";
        echo "<br>";
        echo "Not enough banknotes in ATM! Try to reduce amount!";
        echo "<br>";
        echo "<a href='index.php'>Main page</a>";
        exit();
    } else {
        foreach ($banknotesATM as $key => $value) {
            $currentAmountBills = intval($money / $key);
            if ($currentAmountBills <= $value) {
                $cashGive[$key] = $currentAmountBills;
                $money -= $currentAmountBills * $key;
                $banknotesATM[$key] -= $currentAmountBills;
            } else {
                $money -= $banknotesATM[$key] * $key;
                $cashGive[$key] = $banknotesATM[$key];
                $banknotesATM[$key] = 0;
            }
        }
        if ($money != 0) {
            echo "Cash asked: {$askedMoney}";
            echo "<br>";
            echo "Not possible to give such money! There are no needed banknotes! Try to change amount!";
            echo "<br>";
            echo "<a href='index.php'>Main page</a>";
            exit();
        };
    }

    $totalCashATM -= $askedMoney;

    $answer = "";
    foreach ($cashGive as $key => $value) {
        if ($value != 0) {
            $answer .= "$key x $value ";
        }
    }

    echo "Banknotes in ATM:";
    echo "<br>";
    foreach ($banknotesATM as $key => $value) {
        echo "Banknote: $$key, amount: $banknotesATM[$key]";
        echo "<br>";
    }

    $handle = fopen('data.json', 'wb');
    $dataWrite = json_encode($banknotesATM, true);
    fwrite($handle, $dataWrite);
    fclose($handle);

    echo "<br>";
    echo "Total cash in ATM: $totalCashATM";
    echo "<br>";
    echo "<br>";

    echo "Cash asked: {$askedMoney}";
    echo "<br>";
    echo "Amount of banknotes: {$answer}";
    echo "<br>";
    echo "<a href='index.php'>Main page</a>";
}

