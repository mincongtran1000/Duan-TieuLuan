<?php
session_start();
require '../autoload/session.php';
require '../autoload/db.php';
require '../layouts/header.php';
// Nếu có yêu cầu xoá
if (isset($_GET['delete'])) {
    $id = (int)$_GET['delete'];

    // Không cho xoá tài khoản mặc định admin
    $stmt = $conn->prepare("SELECT username FROM admin WHERE id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $res = $stmt->get_result()->fetch_assoc();

    if ($res) {
        if ($res['username'] === 'admin') {
            $_SESSION['error_message'] = "Không thể xoá tài khoản hệ thống!";
        } else {
            $stmt = $conn->prepare("DELETE FROM admin WHERE id=?");
            $stmt->bind_param("i", $id);
            if ($stmt->execute()) {
                $_SESSION['success_message'] = "Xoá admin thành công!";
            } else {
                $_SESSION['error_message'] = "Xoá thất bại!";
            }
        }
    } else {
        $_SESSION['error_message'] = "Admin không tồn tại!";
    }

    header("Location: index.php");
    exit;
}
// Lấy danh sách admin
$result = $conn->query("SELECT id, username, email, created_at FROM admin");
?>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <title>Quản lý Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
    <div class="container">
        <h2>Danh sách Admin</h2>
        <!-- Hiển thị thông báo -->
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

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?= htmlspecialchars($row['id']) ?></td>
                        <td>
                            <?= htmlspecialchars($row['username']) ?>
                            <?php if ($row['username'] === 'admin'): ?>
                                <span class="badge bg-danger">Hệ Thống</span>
                            <?php else: ?>
                                <span class="badge bg-primary">QTV</span>
                            <?php endif; ?>
                        </td>
                        <td><?= htmlspecialchars($row['email']) ?></td>
                        <td><?= htmlspecialchars($row['created_at']) ?></td>
                        <td>
                            <?php if ($row['username'] !== 'admin'): ?>
                                <a href="?delete=<?= $row['id'] ?>"
                                    class="btn btn-sm btn-danger"
                                    onclick="return confirm('Bạn có chắc muốn xoá admin này?')">Xoá</a>
                            <?php else: ?>
                                <span class="text-muted">Không thể xoá</span>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</body>
<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    h2 {
        font-weight: 600;
        margin-bottom: 20px;
    }

    .container {
        background-color: #fff;
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        max-width: 900px;
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

    .badge {
        font-size: 0.8rem;
        padding: 0.4em 0.6em;
        border-radius: 6px;
    }

    .badge.bg-danger {
        background-color: #dc3545;
    }

    .badge.bg-primary {
        background-color: #0d6efd;
    }

    .btn-danger.btn-sm {
        padding: 4px 10px;
        font-size: 14px;
        transition: 0.2s;
    }

    .btn-danger.btn-sm:hover {
        background-color: #c82333;
        box-shadow: 0 2px 8px rgba(200, 50, 50, 0.3);
    }

    .alert {
        border-radius: 6px;
    }

    .table tbody tr:hover {
        background-color: #f1f8ff;
        transition: 0.2s;
    }

    a.btn-secondary {
        margin-bottom: 20px;
    }
</style>

</html>