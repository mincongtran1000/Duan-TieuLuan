<!-- includes/footer.php -->
<style>
    html,
    body {
        height: 100%;
        margin: 0;
    }

    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    main,
    .content-wrapper {
        flex: 1;
    }

    footer {
        margin-top: auto;
        background-color: #212529;
        color: #fff;
        text-align: center;
        padding: 20px 0;
        font-size: 0.9rem;
    }

    footer .footer-info {
        margin-bottom: 8px;
    }

    footer a {
        color: #ffc107;
        text-decoration: none;
    }

    footer a:hover {
        text-decoration: underline;
    }
</style>

<footer>
    <div class="footer-info">
        <p><strong>Shop Công Nghệ My Website</strong></p>
        <p>Email: <a href="mailto:support@mywebsite.com">support@mywebsite.com</a> |
            Hotline: <a href="tel:0123456789">0123 456 789</a></p>
        <p>Địa chỉ: 123 Đường Nguyễn Văn Cừ, Quận 5, TP. Hồ Chí Minh</p>
    </div>
    <p>&copy; <?= date("Y") ?> - My Website. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>