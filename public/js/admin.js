let allUsers = []; // simpan semua data user

// ==================== USER MANAGEMENT FUNCTIONS ====================
document.addEventListener("DOMContentLoaded", function () {
    loadUserTable();
});

function formatDate(dateStr) {
    const date = new Date(dateStr);
    return date.toLocaleDateString("id-ID", {
        year: "numeric",
        month: "short",
        day: "numeric"
    });
}

function loadUserTable() {
    fetch("../api/get_user_admin.php")
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                allUsers = result.data; // simpan data asli
                renderUserTable(allUsers); // render default
            } else {
                console.error("⚠️ Gagal memuat data:", result.message);
            }
        })
        .catch(err => console.error("⛔ Fetch error:", err));
}


function renderUserTable(users) {
    const tbody = document.getElementById("userTableBody");
    tbody.innerHTML = "";

    if (users.length === 0) {
        tbody.innerHTML = `<tr><td colspan="7" style="text-align:center;">Tidak ada data pengguna</td></tr>`;
        return;
    }

    users.forEach(user => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
                <td>${user.id_pengguna}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.password}</td>
                <td>${user.role_name}</td>
                <td>${formatDate(user.created_at)}</td>
                <td>
                    <div class="action-buttons">
                        <button class="btn-aksi" title="Edit" data-id="${user.id_pengguna}">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button class="btn-aksi" title="Hapus Data" onclick="deleteUser(${user.id_pengguna})">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </td>
            `;
        tbody.appendChild(tr);
    });
}

// Dropdown system
let currentFocusedIndex = -1;
let isDropdownOpen = false;

function toggleDropdown(dropdownId) {
    const dropdown = document.getElementById(dropdownId);
    const container = document.getElementById('userDropdown');

    if (dropdown.classList.contains('show')) {
        closeDropdown(dropdownId);
    } else {
        openDropdown(dropdownId);
    }
}

function openDropdown(dropdownId) {
    const dropdown = document.getElementById(dropdownId);
    const container = document.getElementById('userDropdown');

    dropdown.classList.add('show');
    container.classList.add('active');
    isDropdownOpen = true;
    currentFocusedIndex = -1;

    // Focus pada dropdown untuk keyboard navigation
    dropdown.focus();
}

function closeDropdown(dropdownId) {
    const dropdown = document.getElementById(dropdownId);
    const container = document.getElementById('userDropdown');

    dropdown.classList.remove('show');
    container.classList.remove('active');
    isDropdownOpen = false;
    currentFocusedIndex = -1;

    // Hapus semua focused class
    const items = dropdown.querySelectorAll('.dropdown-item');
    items.forEach(item => item.classList.remove('focused'));
}

function focusItem(index) {
    const dropdown = document.getElementById('dropdown1');
    const items = dropdown.querySelectorAll('.dropdown-item');

    if (index >= 0 && index < items.length) {
        // Hapus fokus sebelumnya
        items.forEach(item => item.classList.remove('focused'));

        // Tambah fokus baru
        items[index].classList.add('focused');
        currentFocusedIndex = index;

        // Scroll ke item yang difokus
        items[index].scrollIntoView({
            block: 'nearest',
            behavior: 'smooth'
        });
    }
}

function selectCurrentItem() {
    const dropdown = document.getElementById('dropdown1');
    const items = dropdown.querySelectorAll('.dropdown-item');

    if (currentFocusedIndex >= 0 && currentFocusedIndex < items.length) {
        const currentItem = items[currentFocusedIndex];
        const href = currentItem.getAttribute('href');

        if (href && href !== '#') {
            window.location.href = href;
        } else {
            // Jika hanya # atau kosong, tampilkan alert (untuk demo)
            alert('Navigasi ke: ' + currentItem.querySelector('span').textContent);
        }

        closeDropdown('dropdown1');
    }
}

// Event listener untuk keyboard navigation
document.addEventListener('keydown', function (e) {
    if (!isDropdownOpen) return;

    const dropdown = document.getElementById('dropdown1');
    const items = dropdown.querySelectorAll('.dropdown-item');
    const totalItems = items.length;

    switch (e.key) {
        case 'ArrowDown':
            e.preventDefault();
            currentFocusedIndex = currentFocusedIndex < totalItems - 1 ? currentFocusedIndex + 1 : 0;
            focusItem(currentFocusedIndex);
            break;

        case 'ArrowUp':
            e.preventDefault();
            currentFocusedIndex = currentFocusedIndex > 0 ? currentFocusedIndex - 1 : totalItems - 1;
            focusItem(currentFocusedIndex);
            break;

        case 'Enter':
            e.preventDefault();
            selectCurrentItem();
            break;

        case 'Escape':
            e.preventDefault();
            closeDropdown('dropdown1');
            break;

        case 'Tab':
            closeDropdown('dropdown1');
            break;
    }
});

// Tutup dropdown ketika klik di luar
document.addEventListener('click', function (e) {
    const container = document.getElementById('userDropdown');
    if (!container.contains(e.target)) {
        closeDropdown('dropdown1');
    }
});

// Event listener untuk hover pada item
document.addEventListener('DOMContentLoaded', function () {
    const items = document.querySelectorAll('.dropdown-item');
    items.forEach((item, index) => {
        item.addEventListener('mouseenter', function () {
            if (isDropdownOpen) {
                // Hapus fokus keyboard sebelumnya
                items.forEach(i => i.classList.remove('focused'));
                currentFocusedIndex = index;
                item.classList.add('focused');
            }
        });

        item.addEventListener('mouseleave', function () {
            item.classList.remove('focused');
        });
    });
});

// system statistic
document.addEventListener('DOMContentLoaded', function () {
    loadStatistics();
});

function loadStatistics() {
    fetch('../api/get_statistics.php')
        .then(res => res.json())
        .then(result => {
            if (result.success) {
                document.getElementById('totalUsers').textContent = result.data.totalUsers;
                document.getElementById('adminCount').textContent = result.data.adminProv + result.data.adminKabkot;
                document.getElementById('userCount').textContent = result.data.pegawai;
                document.getElementById('pemeriksaCount').textContent = result.data.pemeriksa + result.data.operator;
                document.getElementById('todayUsers').textContent = result.data.todayUsers;
            } else {
                console.error(result.message);
            }
        })
        .catch(err => console.error('Error:', err));
}

// add user
// -------- utilities notification (pakai style .notification yang sudah ada) --------
function showNotif(message, isSuccess = true) {
    const notif = document.createElement('div');
    notif.className = 'notification ' + (isSuccess ? 'success' : 'error');
    notif.innerHTML = `<i class="fas ${isSuccess ? 'fa-check-circle' : 'fa-exclamation-circle'}"></i> ${message}`;
    document.body.appendChild(notif);
    setTimeout(() => notif.remove(), 3500);
}

function openModal() {
    const modal = document.getElementById('userModal')
    modal.style.display = 'block';
    document.body.style.overflow = 'hidden';

    // Scroll ke atas saat modal dibuka
    setTimeout(() => {
        const modalBody = document.querySelector('.modal-body');
        if (modalBody) {
            modalBody.scrollTo({ top: 0, behavior: 'smooth' });
        }
    }, 100);

    // Smooth animation
    setTimeout(() => {
        modal.style.opacity = 1;
    }, 10);
}

function closeModal() {
    const modal = document.getElementById('userModal');
    modal.style.display = 'none';
    document.body.style.overflow = 'auto';

    // Reset form
    const form = document.getElementById('userForm');
    form.reset();
    form.querySelector('input[name="id_pengguna"]').value = '';

    // Reset modal title & button
    document.getElementById('modalTitle').textContent = 'Tambah Pengguna Baru';
    modal.querySelector('.btn-submit').innerHTML = '<i class="fas fa-paper-plane"></i> Simpan Data';
}

// Tutup modal jika klik di luar konten
window.onclick = function (event) {
    const modal = document.getElementById('userModal');
    if (event.target === modal) {
        closeModal();
    }
};

// Esc to close
document.addEventListener('keydown', function (e) {
    const modal = document.getElementById('userModal');
    if (modal.style.display === 'block' && e.key === 'Escape') {
        closeModal();
    }
});

// Notification Styles
const style = document.createElement('style');
style.textContent = `
    .notification {
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        border-radius: 8px;
        color: white;
        font-weight: 600;
        z-index: 10000;
        display: flex;
        align-items: center;
        gap: 10px;
        animation: slideInRight 0.3s ease;
    }
    .notification.success {
        background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
    }
    .notification.error {
        background: linear-gradient(135deg, #dc3545 0%, #fd7e14 100%);
    }
    @keyframes slideInRight {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }`;
document.head.appendChild(style);

// handler data modal
document.getElementById('userForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const action = document.getElementById('action').value;
    const url = action === 'edit' ? '../api/edit_user.php' : '../api/add_user.php';

    const formData = new FormData(this);

    try {
        const response = await fetch(url, {
            method: 'POST',
            body: formData
        });

        const result = await response.json();

        showNotif(result.message, result.success);
        if (result.success) {
            closeModal();
            loadUserTable();
        }
    } catch (error) {
        console.error('⛔ Gagal submit:', error);
        showNotif('Terjadi kesalahan server.', false);
    }
});

// delete data
function deleteUser(id) {
    fetch('../api/delete_user.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id })
    })
        .then(res => res.json())
        .then(result => {
            alert(result.message);
            if (result.success) {
                loadUserTable();
            }
        })
        .catch(err => {
            console.error("Error saat menghapus:", err);
        });
}

// Update Data
document.addEventListener('click', function (e) {
    const btn = e.target.closest('.btn-aksi[title="Edit"]');
    if (btn) {
        const id_pengguna = btn.dataset.id; // ambil id_pengguna
        if (!id_pengguna) {
            alert("id_pengguna tidak ditemukan");
            return;
        }
        updateUser(id_pengguna);
    }
});


function updateUser(id_pengguna) {
    fetch(`../api/get_single_user.php?id_pengguna=${id_pengguna}`)
        .then(res => res.json())
        .then(data => {
            if (!data.success) {
                alert(data.message);
                return;
            }

            const item = data.data;

            // isi kolom inputan
            document.getElementById('action').value = 'edit';
            document.getElementById('userId').value = item.id_pengguna;
            document.getElementById('username').value = item.username;
            document.getElementById('email').value = item.email;
            document.getElementById('pass').value = item.password;
            document.getElementById('role').value = item.id_role;

            openModal();
            document.getElementById('modalTitle').textContent = 'Edit User';
            document.querySelector('.btn-submit').innerHTML = '<i class="fas fa-save"></i> update data';
        })

        .catch(err => {
            console.error('Gagal ambil data:', err);
            alert('Terjadi kesalahan saat mengambil data.');
        })
}

// FIlter System

function filterUsers() {
    const keyword = document.getElementById('searchInput').value.toLowerCase();
    const roleValue = document.getElementById('roleFilter').value;

    const filtered = allUsers.filter(user => {
        const matchKeyword =
            user.username.toLowerCase().includes(keyword) ||
            user.email.toLowerCase().includes(keyword);

        const matchRole =
            roleValue === "all" || user.id_role == roleValue;

        return matchKeyword && matchRole;
    });

    renderUserTable(filtered);
}

document.addEventListener("DOMContentLoaded", function () {
    // filter saat klik tombol
    document.getElementById('applyFilters').addEventListener('click', filterUsers);

    // reset filter
    document.getElementById('resetFilters').addEventListener('click', () => {
        document.getElementById('searchInput').value = "";
        document.getElementById('roleFilter').value = "all";
        renderUserTable(allUsers);
    });

    // langsung jalan saat ketik
    document.getElementById('searchInput').addEventListener('keyup', filterUsers);
});
