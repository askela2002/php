<?php
session_start();

$bills = $_SESSION['bills'];
$totalCashMachine = $_SESSION['totalCashMachine'];
$amountBillsATM = $_SESSION['amountBillsATM'];

$askedMoney = floatval($_POST['money']);

$amountBillsGet = array();

if ($askedMoney == 0 || $askedMoney - intval($askedMoney) != 0) {
    echo "The amount is wrong! Try to change amount!";
    echo "<br>";
    echo "<a href='index.php'>Main page</a>";
    exit();
}

$money = $askedMoney;
if ($askedMoney > $totalCashMachine) {
    echo "Cash asked: {$askedMoney}";
    echo "<br>";
    echo "Not enough banknotes in ATM! Try to reduce amount!";
    echo "<br>";
    echo "<a href='index.php'>Main page</a>";
    exit();
} else {
    for ($i = 0; $i < count($bills); $i++) {
        $currentAmountBills = intval($money / $bills[$i]);
        if ($currentAmountBills <= $amountBillsATM[$i]) {
            array_push($amountBillsGet, $currentAmountBills);
            $money -= $currentAmountBills * $bills[$i];
        } else if ($amountBillsATM[$i]) {
            $money -= $amountBillsATM[$i] * $bills[$i];
            array_push($amountBillsGet, $amountBillsATM[$i]);
        } else {
            array_push($amountBillsGet, 0);
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

$answer = "";
for ($i = 0; $i < count($bills); $i++) {
    if ($amountBillsGet[$i] != 0) {
        $answer .= "{$amountBillsGet[$i]} x {$bills[$i]} ";
    }
}

echo "Cash asked: {$askedMoney}";
echo "<br>";
echo "Amount of banknotes: {$answer}";
echo "<br>";
echo "<a href='index.php'>Main page</a>";

