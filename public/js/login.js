document.getElementById('loginForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const form = e.target;
    const username = form.username.value.trim();
    const password = form.password.value.trim();

    const errorContainer = document.getElementById('errorContainer');
    const errorText = document.getElementById('errorText');
    const loginBtn = document.getElementById('loginBtn');

    // Validasi kosong
    if (!username || !password) {
        errorText.textContent = "Username dan Password tidak boleh kosong.";
        errorContainer.style.display = 'flex';
        return;
    }

    // Tombol loading
    loginBtn.classList.add('btn-loading');
    loginBtn.disabled = true;

    try {
        console.log('Mengirim login via fetch...');

        const res = await fetch('app/controllers/proses_login.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({ username, password })
        });

        const data = await res.json();

        if (data.success) {
            window.location.href = data.redirect; // Redirect ke dashboard
        } else {
            errorText.textContent = data.message;
            errorContainer.style.display = 'flex';
        }
    } catch (err) {
        errorText.textContent = "Terjadi kesalahan koneksi.";
        errorContainer.style.display = 'flex';
    } finally {
        loginBtn.classList.remove('btn-loading');
        loginBtn.disabled = false;
    }
});

// Toggle password visibility
document.getElementById('togglePassword').addEventListener('click', function () {
    const passwordField = document.getElementById('password');
    const icon = this;

    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash'); // ganti jadi icon slashed
    } else {
        passwordField.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye'); // kembali ke icon biasa
    }
});
