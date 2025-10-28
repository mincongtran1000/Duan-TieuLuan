<?php
session_start();
require 'includes/db.php';

if (!isset($_SESSION['user_id'])) {
    die("Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.");
}

$user_id = $_SESSION['user_id'];
$product_id = intval($_POST['product_id']);
$quantity = intval($_POST['quantity'] ?? 1);

// 1. Tạo hoặc lấy transaction đang pending
$sql = "SELECT id FROM transactions WHERE user_id = ? AND status = 'pending' LIMIT 1";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $transaction_id = $result->fetch_assoc()['id'];
} else {
    $sql = "INSERT INTO transactions (user_id, total_amount, status) VALUES (?, 0, 'pending')";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $transaction_id = $stmt->insert_id;
}

// 2. Lấy giá sản phẩm
$sql = "SELECT price FROM products WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 0) {
    die("Sản phẩm không tồn tại.");
}

$price = $result->fetch_assoc()['price'];

// 3. Thêm vào orders
$sql = "INSERT INTO orders (transaction_id, product_id, quantity, price)
        VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iiid", $transaction_id, $product_id, $quantity, $price);

if ($stmt->execute()) {
    echo "Đã thêm vào giỏ hàng.";
} else {
    echo "Lỗi khi thêm vào giỏ hàng: " . $stmt->error;
}
