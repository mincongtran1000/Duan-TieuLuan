<?php
require 'includes/session.php';
require 'includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_SESSION['user_id'])) {
    $user_id = intval($_SESSION['user_id']);
    $product_id = intval($_POST['product_id']);
    $rating = intval($_POST['rating']);
    $comment = trim($_POST['comment']);
    // Kiểm tra số lượt đánh giá của user cho sản phẩm này
    $check_stmt = $conn->prepare("
        SELECT COUNT(*) AS cnt 
        FROM product_reviews 
        WHERE user_id = ? AND product_id = ?
    ");
    $check_stmt->bind_param("ii", $user_id, $product_id);
    $check_stmt->execute();
    $check_result = $check_stmt->get_result()->fetch_assoc();

    if ($check_result['cnt'] >= 5) {
        echo "<script>alert('Bạn đã đạt giới hạn 5 lượt đánh giá cho sản phẩm này.');history.back();</script>";
        exit;
    }

    // bảo vệ rating
    if ($rating < 1) $rating = 1;
    if ($rating > 5) $rating = 5;

    $stmt = $conn->prepare("
    INSERT INTO product_reviews (product_id, user_id, rating, comment, created_at)
    VALUES (?, ?, ?, ?, NOW())
");

    $stmt->bind_param("iiis", $product_id, $user_id, $rating, $comment);
    $stmt->execute();

    header("Location: product_detail.php?id=$product_id");
    exit;
}
