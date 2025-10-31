<?php
require '../session.php';
require '../../includes/db.php';

// Chỉ cho admin đăng nhập
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: ../login.php");
    exit;
}

// Lấy danh sách đánh giá
$sql = "
SELECT 
    r.id, 
    r.rating, 
    r.comment, 
    r.created_at, 
    p.name AS product_name, 
    u.username AS user_name
FROM product_reviews r
JOIN products p ON r.product_id = p.id
JOIN users u ON r.user_id = u.id
ORDER BY r.created_at DESC
";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Quản lý đánh giá</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container mt-5">

        <a href="../index.php" class="btn btn-secondary mb-3">⬅ Quay lại Dashboard</a>
        <h1 class="mb-4">📊 Quản lý đánh giá sản phẩm</h1>

        <?php if ($result && $result->num_rows > 0): ?>
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Sản phẩm</th>
                        <th>Người dùng</th>
                        <th>Số sao</th>
                        <th>Bình luận</th>
                        <th>Ngày tạo</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= $row['id'] ?></td>
                            <td><?= htmlspecialchars($row['product_name']) ?></td>
                            <td><?= htmlspecialchars($row['user_name']) ?></td>
                            <td><span class="badge bg-warning text-dark"><?= $row['rating'] ?>/5</span></td>
                            <td><?= htmlspecialchars($row['comment']) ?></td>
                            <td><?= $row['created_at'] ?></td>
                            <td>
                                <a href="delete.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-danger"
                                    onclick="return confirm('Xoá đánh giá này?')">Xoá</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <div class="alert alert-secondary text-center">Không có đánh giá nào.</div>
        <?php endif; ?>
    </div>

</body>

</html>