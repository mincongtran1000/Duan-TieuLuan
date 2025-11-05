<?php
if (session_status() === PHP_SESSION_NONE) session_start();
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>

<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="index.php">⚙️ Quản trị Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar" aria-controls="adminNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="adminNavbar">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <?php $base_url = '/my_website/admin/'; ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $base_url ?>index.php">🏠 Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $base_url ?>users/index.php">👥 Người dùng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $base_url ?>products/index.php">📦 Sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $base_url ?>transaction/index.php">💳 Giao dịch</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $base_url ?>ratings/index.php">⭐ Đánh giá</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $base_url ?>admin/index.php">👨‍💼Admin</a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= $base_url ?>logout.php" class="btn btn-outline-danger btn-sm">
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <style>
        .navbar-nav .nav-item {
            margin-right: 15px;
        }

        .navbar-nav .nav-link {
            color: #fff;
            font-weight: 500;
            transition: 0.2s;
        }

        .navbar-nav .nav-link:hover {
            color: #ffc107;
            text-decoration: underline;
        }
    </style>