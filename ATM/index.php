<?php
session_start();

$bills = array(500, 200, 100, 50, 20, 10, 5);

$_SESSION['bills'] = $bills;

$amountBillsATM = array();
$totalCashMachine = 0;

echo "Banknotes in ATM:";
echo "<br>";
for ($i = 0; $i < count($bills); $i++) {
    $numberBill = rand(0, 5);
    array_push($amountBillsATM, $numberBill);
    $totalCashMachine += $bills[$i] * $numberBill;
    echo "Banknote: {$bills[$i]}, number: {$numberBill}";
    echo "<br>";
}
echo "<br>";
echo "Total cash in ATM: {$totalCashMachine}";
echo "<br>";
echo "<br>";

$_SESSION['totalCashMachine'] = $totalCashMachine;
$_SESSION['amountBillsATM'] = $amountBillsATM;


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


