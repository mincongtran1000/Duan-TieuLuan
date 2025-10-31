<?php
session_start();
require 'includes/db.php';

// Nếu chưa đăng nhập
if (!isset($_SESSION['user_id'])) {
    echo '
    <div style="
        display:flex;
        justify-content:center;
        align-items:center;
        height:100vh;
        flex-direction:column;
        font-family:Arial, sans-serif;
    ">
        <p style="font-size:20px; margin-bottom:20px;">
            Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.
        </p>
        <a href="login.php" 
           style="
               padding:12px 30px;
               background:#007bff;
               color:white;
               border-radius:6px;
               text-decoration:none;
               font-size:16px;
           "
           onmouseover="this.style.background=\'#0056b3\'"
           onmouseout="this.style.background=\'#007bff\'">
           Đăng nhập
        </a>
    </div>';
    exit();
}

$user_id = $_SESSION['user_id'];
$product_id = intval($_POST['product_id']);
$quantity = intval($_POST['quantity'] ?? 1);

// 1. Lấy hoặc tạo transaction pending
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
    echo '
    <div style="
        display:flex;
        justify-content:center;
        align-items:center;
        height:100vh;
        flex-direction:column;
        font-family:Arial, sans-serif;
    ">
        <p style="font-size:20px; margin-bottom:20px; color:green;">
            Sản phẩm đã được thêm vào giỏ hàng!
        </p>
        <a href="cart.php" 
           style="
               padding:12px 30px;
               background:#28a745;
               color:white;
               border-radius:6px;
               text-decoration:none;
               font-size:16px;
           "
           onmouseover="this.style.background=\'#1e7e34\'"
           onmouseout="this.style.background=\'#28a745\'">
           Xem giỏ hàng
        </a>
    </div>';
    exit();
} else {
    echo "Lỗi khi thêm vào giỏ hàng: " . $stmt->error;
}
