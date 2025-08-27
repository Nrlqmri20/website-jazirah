// Toggle dropdown
function toggleDropdown(dropdownId) {
    const dropdown = document.getElementById(dropdownId);
    if (!dropdown) return;

    const userInfo = dropdown.closest('.user-info');

    // Tutup semua dropdown lain
    document.querySelectorAll('.dropdown-menu').forEach(menu => {
        if (menu.id !== dropdownId) {
            menu.classList.remove('show');
            const parentInfo = menu.closest('.user-info');
            if (parentInfo) parentInfo.classList.remove('active');
        }
    });

    // Toggle dropdown yang dipilih
    dropdown.classList.toggle('show');
    if (userInfo) userInfo.classList.toggle('active');
}

// Tutup dropdown jika klik di luar
document.addEventListener('click', function (event) {
    if (!event.target.closest('.user-info')) {
        document.querySelectorAll('.dropdown-menu').forEach(menu => {
            menu.classList.remove('show');
            const parentInfo = menu.closest('.user-info');
            if (parentInfo) parentInfo.classList.remove('active');
        });
    }
});

// Switch tab - Fixed version
function switchTab(tabName, event) {
    if (!tabName) return;

    // Sembunyikan semua konten tab
    document.querySelectorAll('.tab-content').forEach(content => {
        content.classList.remove('active');
    });

    // Hapus class active dari semua tombol tab
    document.querySelectorAll('.tab-button').forEach(button => {
        button.classList.remove('active');
    });

    // Tampilkan tab yang dipilih
    const tabContent = document.getElementById(tabName);
    if (tabContent) {
        tabContent.classList.add('active');
    }

    // Tandai tombol tab yang diklik
    if (event && event.currentTarget) {
        event.currentTarget.classList.add('active');
    } else {
        // Jika tidak ada event, cari button berdasarkan onclick attribute
        document.querySelectorAll('.tab-button').forEach(button => {
            const onclickAttr = button.getAttribute('onclick');
            if (onclickAttr && onclickAttr.includes(`'${tabName}'`)) {
                button.classList.add('active');
            }
        });
    }
}



// Form validation (password match)
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function (e) {
            const newPass = form.querySelector('input[name="new_password"]');
            const confirmPass = form.querySelector('input[name="confirm_password"]');

            if (newPass && confirmPass && newPass.value !== confirmPass.value) {
                e.preventDefault();
                alert('Password baru dan konfirmasi password tidak cocok!');
                return false;
            }
        });
    });

    // Set tab aktif saat halaman dimuat
    const activeTab = document.querySelector('.tab-button.active');
    if (activeTab) {
        const onclickAttr = activeTab.getAttribute('onclick');
        if (onclickAttr) {
            const tabName = onclickAttr.match(/'([^']+)'/);
            if (tabName && tabName[1]) {
                switchTab(tabName[1]);
            }
        }
    }
});

// Event listener untuk tab buttons
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.tab-button').forEach(button => {
        button.addEventListener('click', function (e) {
            const onclickAttr = this.getAttribute('onclick');
            if (onclickAttr) {
                const tabName = onclickAttr.match(/'([^']+)'/);
                if (tabName && tabName[1]) {
                    switchTab(tabName[1], e);
                }
            }
        });
    });
});

// Toggle password visibility (mata 👁️)
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.password-toggle').forEach(toggle => {
        toggle.addEventListener('click', function () {
            const targetId = this.getAttribute('data-target');
            const input = document.getElementById(targetId);

            if (input.type === 'password') {
                input.type = 'text';
                this.classList.remove('fa-eye');
                this.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                this.classList.remove('fa-eye-slash');
                this.classList.add('fa-eye');
            }
        });
    });
});

// stat user
document.addEventListener("DOMContentLoaded", function () {
    fetch("../api/get_stat_user.php")
        .then(res => res.json())
        .then(res => {
            if (res.success) {
                document.getElementById("statTotal").textContent = res.data.total_kegiatan;
                document.getElementById("statAvg").textContent = res.data.avg_progress + "%";
                document.getElementById("statCompleted").textContent = res.data.completed;
            } else {
                console.error("Gagal ambil data statistik:", res.message);
            }
        })
        .catch(err => console.error("Error fetch stats:", err));
});

document.addEventListener("DOMContentLoaded", function () {
    // Ambil data profil
    fetch("../api/get_profil.php")
        .then(res => res.json())
        .then(res => {
            if (res.success) {
                const data = res.data;

                // isi form
                document.querySelector("input[name='username']").value = data.username || "";
                document.querySelector("input[name='nama_lengkap']").value = data.nama_lengkap || "";
                document.querySelector("input[name='email']").value = data.email || "";
                document.querySelector("input[name='nomor_telepon']").value = data.nomor_telepon || "";
                document.querySelector("input[name='jabatan']").value = data.jabatan || "";
                document.querySelector("input[name='bidang']").value = data.bidang || "";
                document.querySelector("select[name='satker']").value = data.satker || "";
                document.querySelector("input[name='tanggal_gabung']").value = data.tanggal_gabung || "";

                // tampilkan avatar
                const avatarImage = document.getElementById("avatarImage");
                const avatarDefault = document.getElementById("avatarDefault");

                if (res.avatar.startsWith("placeholder:")) {
                    avatarImage.classList.add("hidden");
                    avatarDefault.textContent = res.avatar.split(":")[1]; // huruf pertama
                    avatarDefault.classList.remove("hidden");
                } else {
                    avatarImage.src = res.avatar;
                    avatarImage.classList.remove("hidden");
                    avatarDefault.classList.add("hidden");
                }
            } else {
                alert("Gagal memuat profil!");
            }
        });
});

// Update data personal
document.addEventListener("DOMContentLoaded", function () {
    const personalForm = document.getElementById("personalForm");
    if (personalForm) {
        personalForm.addEventListener("submit", function (e) {
            e.preventDefault();
            const formData = new FormData(this);

            fetch("../api/update_personal_data.php", {
                method: "POST",
                body: formData,
            })
                .then(res => res.json())
                .then(res => {
                    alert(res.message);
                })
                .catch(err => {
                    console.error("Error", err);
                    alert("Terjadi kesalahan saat menyimpan data.");
                });
        });
    }
});

// Hook ke input file (upload avatar)
document.getElementById("avatarInput").addEventListener("change", function () {
    if (this.files[0]) {
        const formData = new FormData();
        formData.append("avatar", this.files[0]);

        fetch("../api/upload_foto.php", {
            method: "POST",
            body: formData,
        })
            .then(res => res.json())
            .then(res => {
                console.log(res); // cek apa yang sebenarnya dikirim balik
                if (res.success) {
                    document.getElementById("avatarImage").src = "../../public/img/profil/" + res.filename;
                    document.getElementById("avatarImage").classList.remove("hidden");
                    document.getElementById("avatarDefault").classList.add("hidden");
                }
                alert(res.message);
            });
    }
});

// Toggle menu avatar
function toggleAvatarMenu(event) {
    event.stopPropagation();
    document.getElementById("avatarMenu").classList.toggle("hidden");
}

// Tutup menu jika klik di luar avatar
document.addEventListener("click", function (e) {
    const menu = document.getElementById("avatarMenu");
    if (!e.target.closest(".avatar-container")) {
        menu.classList.add("hidden");
    }
});

// Lihat foto (fullscreen)
function viewAvatar() {
    const avatar = document.getElementById("avatarImage");
    if (avatar && !avatar.classList.contains("hidden")) {
        document.getElementById("modalAvatar").src = avatar.src;
        document.getElementById("avatarModal").style.display = "flex";
    } else {
        alert("Belum ada foto profil.");
    }
}

function deleteAvatar() {
    if (!confirm("Yakin ingin menghapus foto profil?")) return;

    fetch("../api/delete_foto.php", { method: "POST" })
        .then(res => res.json())
        .then(res => {
            if (res.success) {
                // elemen
                const avatarImg = document.getElementById("avatarImage");
                const avatarDefault = document.getElementById("avatarDefault");
                const modalAvatar = document.getElementById("modalAvatar");

                // kosongkan src & sembunyikan gambar
                if (avatarImg) {
                    avatarImg.src = "";
                    avatarImg.removeAttribute("src");
                    avatarImg.classList.add("hidden"); // pastikan .hidden = display:none
                    avatarImg.style.display = "none";
                }

                // set huruf awal dari username yang ada di header (atau dari data lain)
                let usernameText = "";
                const headerUser = document.querySelector(".user-role");
                if (headerUser) usernameText = headerUser.textContent.trim();
                // fallback bila tidak ada
                if (!usernameText && window.USERNAME) usernameText = window.USERNAME;
                const initial = (usernameText || "?").charAt(0).toUpperCase();

                if (avatarDefault) {
                    avatarDefault.textContent = initial;
                    avatarDefault.classList.remove("hidden");
                    avatarDefault.style.display = "flex"; // sesuai CSS placeholder
                }

                // kosongkan modal image
                if (modalAvatar) {
                    modalAvatar.src = "";
                }

                // Opsional: update juga elemen lain yang menampilkan avatar (mis. navbar)
                const navAvatar = document.querySelector("#navAvatarImage");
                if (navAvatar) {
                    navAvatar.src = ""; navAvatar.classList.add("hidden");
                }

                alert(res.message || "Foto profil berhasil dihapus");
            } else {
                alert(res.message || "Gagal menghapus foto");
            }
        })
        .catch(err => {
            console.error("Error:", err);
            alert("Terjadi kesalahan. Cek console.");
        });
}
