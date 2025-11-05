<?php
require_once 'includes/session.php';
$cart_count = !empty($_SESSION['cart']) ? count($_SESSION['cart']) : 0;
?>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="index.php">
            <i class="fa-solid fa-house"></i> My Website
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
            
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="index.php">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="products.php">Sản phẩm</a></li>
                <!-- <li class="nav-item"><a class="nav-link" href="promotions.php">Khuyến mãi</a></li> -->
                <li class="nav-item"><a class="nav-link" href="about.php">Giới thiệu</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.php">Liên hệ</a></li>

                <li class="nav-item position-relative">
                    <a class="nav-link" href="cart.php">
                        <i class="fa-solid fa-cart-shopping"></i> Giỏ hàng
                        <?php if ($cart_count > 0): ?>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                <?= $cart_count ?>
                            </span>
                        <?php endif; ?>
                    </a>
                </li>

                <?php if (!empty($_SESSION['username'])): ?>
                    <!-- Khi đã đăng nhập -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user"></i>
                            <?= htmlspecialchars($_SESSION['username']); ?>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="profile.php"><i class="fa-solid fa-id-card"></i> Cá nhân</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item text-danger" href="logout.php"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
                        </ul>
                    </li>
                <?php else: ?>
                    <!-- Khi chưa đăng nhập -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="guestDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user"></i> Tài khoản
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="guestDropdown">
                            <li><a class="dropdown-item" href="register.php"><i class="fa-solid fa-user-plus"></i> Đăng ký</a></li>
                            <li><a class="dropdown-item" href="login.php"><i class="fa-solid fa-right-to-bracket"></i> Đăng nhập</a></li>
                        </ul>
                    </li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</nav>

<style>
    body {
        padding-top: 70px;
        /* tránh navbar che nội dung */
    }

    .nav-link {
        font-size: 0.95rem;
    }

    .navbar-brand {
        font-weight: 600;
    }
</style>