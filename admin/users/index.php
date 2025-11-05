<?php
session_start();
require '../autoload/db.php';
require '../layouts/header.php';

$result = $conn->query("SELECT id, username, fullname, email, phone, address, avatar, created_at FROM users");
?>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <title>Danh sách người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        h2 {
            font-weight: 600;
            margin-bottom: 20px;
        }

        table {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #198754;
            color: #fff;
            text-align: center;
            vertical-align: middle;
        }

        td {
            text-align: center;
            vertical-align: middle;
        }

        img {
            border-radius: 50%;
            object-fit: cover;
        }

        .btn-danger.btn-sm {
            padding: 4px 10px;
            font-size: 14px;
        }

        .alert {
            border-radius: 6px;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body class="p-4">
    <div class="container">
        <a href="../index.php" class="btn btn-secondary mb-3">⬅ Quay lại Dashboard</a>
        <h2>👥 Danh sách người dùng</h2>

        <?php if (isset($_SESSION['success_message'])): ?>
            <div class="alert alert-success">
                <?= $_SESSION['success_message']; ?>
            </div>
            <?php unset($_SESSION['success_message']); ?>
        <?php endif; ?>

        <?php if (isset($_SESSION['error_message'])): ?>
            <div class="alert alert-danger">
                <?= $_SESSION['error_message']; ?>
            </div>
            <?php unset($_SESSION['error_message']); ?>
        <?php endif; ?>

        <table class="table table-bordered table-striped align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Địa chỉ</th>
                    <th>Avatar</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?= htmlspecialchars($row['id']) ?></td>
                        <td><?= htmlspecialchars($row['username']) ?></td>
                        <td><?= htmlspecialchars($row['fullname']) ?></td>
                        <td><?= htmlspecialchars($row['email']) ?></td>
                        <td><?= htmlspecialchars($row['phone']) ?></td>
                        <td><?= htmlspecialchars($row['address']) ?></td>
                        <td>
                            <?php if (!empty($row['avatar'])): ?>
                                <img src="http://localhost/my_website/uploads/avatars/<?= htmlspecialchars($row['avatar']); ?>" alt="avatar" width="50" height="50">
                            <?php else: ?>
                                <span class="text-muted">Chưa có</span>
                            <?php endif; ?>
                        </td>
                        <td><?= htmlspecialchars($row['created_at']) ?></td>
                        <td>
                            <a href="delete.php?id=<?= $row['id']; ?>" class="btn btn-danger btn-sm"
                                onclick="return confirm('Bạn có chắc muốn xóa user này?');">
                                Xóa
                            </a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</html>