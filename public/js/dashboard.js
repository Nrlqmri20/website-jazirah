// 🔹 Definisi awal filter (default kosong)
let currentFilters = {
    search: '',
    kabupaten: '',
    tahun: ''
};

// Load dashboard data
//---------------------------------------------------------------------------------------------------
document.addEventListener('DOMContentLoaded', () => {
    loadDashboardData();
});

function formatDate(dateString) {
    if (!dateString) return '-';
    const [year, month] = dateString.split('-');
    return `${month}-${year}`;
}

function loadDashboardData(filters = currentFilters) {
    const tableBody = document.getElementById('dashboardTable');
    tableBody.innerHTML = `
        <tr>
            <td colspan="9" class="loading">
                <div class="spinner"></div>
            </td>
        </tr>
    `;

    // debug
    // console.log('Load data dengan filter', filters);

    // buat query string dari filter
    const params = new URLSearchParams(filters).toString();
    const url = params ? `../api/get_data.php?${params}` : '../api/get_data.php';

    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error ${response.status}`);
            }
            return response.json();
        })
        .then(result => {
            if (!result.success) {
                tableBody.innerHTML = `<tr><td colspan="9" class="text-danger">${result.message}</td></tr>`;
                return;
            }

            updateStats(result.data);

            const rows = result.data.map((item, index) => `
                <tr>
                    <td>${item.id_deskripsi}.${item.sub_deskripsi}</td>
                    <td>${item.rencana_kerja}</td>
                    <td>${item.rencana_aksi}</td>
                    <td>${item.output}</td>
                    <td>${item.pjk}</td>
                    <td>${formatDate(item.target_bulan)}</td>
                    <td>
                        ${item.link ? `
                            <a href="${item.link}" target="_blank" class="link-btn">
                                <i class="fas fa-external-link-alt"></i> Lihat
                            </a>` : '<span class="text-muted">-</span>'
                }
                    </td>
                    <td>
                        <div class="progress-container">
                            <div class="progress-bar" style="width: ${item.progress}%">
                                <div class="progress-text">${item.progress}%</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-aksi" title="Edit" data-id="${item.id_pendukung}">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn-aksi" title="Hapus Data" data-id="${item.id_pendukung}">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </td>
                </tr>
            `).join('');

            tableBody.innerHTML = rows || `<tr><td colspan="9" class="text-muted">Belum ada data</td></tr>`;

            // 🔁 Tambahkan event listener tombol HAPUS
            document.querySelectorAll('.btn-aksi[title="Hapus Data"]').forEach(btn => {
                btn.addEventListener('click', () => {
                    const id = btn.getAttribute('data-id');
                    if (confirm("Apakah Anda yakin ingin menghapus data ini?")) {
                        deleteData(id);
                    }
                });
            });
        })
        .catch(err => {
            tableBody.innerHTML = `<tr><td colspan="9" class="text-danger">Gagal mengambil data: ${err.message}</td></tr>`;
            console.error('⛔ Fetch error:', err);
        });
}
//---------------------------------------------------------------------------------------------------

// Modal functions
//---------------------------------------------------------------------------------------------------
function openModal() {
    const modal = document.getElementById('formModal');
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
    const modal = document.getElementById('formModal');
    modal.style.display = 'none';
    document.body.style.overflow = 'auto';

    // Reset form
    const form = document.getElementById('inputForm');
    form.reset();
    form.querySelector('input[name="action"]').value = 'add';
    form.querySelector('input[name="id"]').value = '';
    form.querySelector('input[name="sub_deskripsi"]').value = '';

    // Reset modal title & button
    document.querySelector('.modal-header h3').textContent = 'Input Data Monitoring';
    document.querySelector('.btn-submit').innerHTML = '<i class="fas fa-paper-plane"></i> Simpan Data';
}

// Tutup modal jika klik di luar konten
window.onclick = function (event) {
    const modal = document.getElementById('formModal');
    if (event.target === modal) {
        closeModal();
    }
};

// Esc to close
document.addEventListener('keydown', function (e) {
    const modal = document.getElementById('formModal');
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
//---------------------------------------------------------------------------------------------------

//Add data
//---------------------------------------------------------------------------------------------------
document.getElementById('inputForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const formData = new FormData(this);

    try {
        const response = await fetch('/web-jaziran-test/app/api/add_data.php', {
            method: 'POST',
            body: formData
        });

        const result = await response.json();

        const notif = document.createElement('div');
        notif.className = 'notification ' + (result.success ? 'success' : 'error');
        notif.innerHTML = `
            <i class="fas ${result.success ? 'fa-check-circle' : 'fa-exclamation-circle'}"></i>
            ${result.message}
        `;
        document.body.appendChild(notif);

        setTimeout(() => notif.remove(), 4000);

        if (result.success) {
            closeModal();
            loadDashboardData();
        }
    } catch (error) {
        console.error('⛔ Gagal submit:', error);
    }
});
//---------------------------------------------------------------------------------------------------

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

// delete data
function deleteData(id) {
    fetch('../api/delete_data.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id })
    })
        .then(res => res.json())
        .then(result => {
            alert(result.message);
            if (result.success) {
                loadDashboardData(); // refresh tabel
            }
        })
        .catch(err => {
            console.error("Error saat menghapus:", err);
        });
}

// Edit data
document.addEventListener('click', function (e) {
    if (e.target.closest('.btn-aksi[title="Edit"]')) {
        const id = e.target.closest('button').dataset.id;
        fetchEditData(id);
    }
});

function tutupModalEdit() {
    const modal = document.getElementById('modal-edit');
    modal.style.display = 'none';
    document.body.style.overflow = 'auto';

    // Reset form
    const form = document.getElementById('form-edit');
    form.reset();
}

// Tutup modal edit jika klik di luar konten
window.addEventListener('click', function (event) {
    const modal = document.getElementById('modal-edit');
    if (event.target === modal) {
        tutupModalEdit();
    }
});

// Esc to close modal edit
document.addEventListener('keydown', function (e) {
    const modal = document.getElementById('modal-edit');
    if (modal.style.display === 'block' && e.key === 'Escape') {
        tutupModalEdit();
    }
});

// UPDATE fungsi fetchEditData() untuk animasi yang smooth
function fetchEditData(id) {
    fetch('../api/get_single_data.php?id=' + id)
        .then(res => res.json())
        .then(data => {
            if (!data.success) {
                alert(data.message);
                return;
            }

            const item = data.data;

            // Prefill form
            document.getElementById('edit-id').value = item.id_pendukung;
            document.getElementById('edit-id_deskripsi').value = `${item.id_deskripsi}.${item.sub_deskripsi}`;
            document.getElementById('edit-rencana_kerja').value = item.deskripsi_rencana_kinerja;
            document.getElementById('edit-rencana_aksi').value = item.deskripsi_rencana_aksi;
            document.getElementById('edit-output').value = item.deskripsi_rencana_output;
            document.getElementById('edit-pjk').value = item.pjk;
            document.getElementById('edit-target_bulan').value = item.target_bulan;
            document.getElementById('edit-link').value = item.link;
            document.getElementById('edit-progress').value = item.progress;

            // Tampilkan modal dengan animasi smooth
            const modal = document.getElementById('modal-edit');
            modal.style.display = 'block';
            document.body.style.overflow = 'hidden';

            // Scroll ke atas saat modal dibuka
            setTimeout(() => {
                const modalBody = modal.querySelector('.modal-body');
                if (modalBody) {
                    modalBody.scrollTo({ top: 0, behavior: 'smooth' });
                }
            }, 100);

            // Smooth animation
            setTimeout(() => {
                modal.style.opacity = 1;
            }, 10);
        })
        .catch(err => {
            console.error('Gagal ambil data:', err);
            alert('Terjadi kesalahan saat mengambil data.');
        });
}

document.getElementById('form-edit').addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = {
        id: document.getElementById('edit-id').value,
        id_deskripsi: document.getElementById('edit-id_deskripsi').value,
        deskripsi_rencana_kinerja: document.getElementById('edit-rencana_kerja').value,
        deskripsi_rencana_aksi: document.getElementById('edit-rencana_aksi').value,
        deskripsi_rencana_output: document.getElementById('edit-output').value,
        pjk: document.getElementById('edit-pjk').value,
        target_bulan: document.getElementById('edit-target_bulan').value,
        link: document.getElementById('edit-link').value,
        progress: document.getElementById('edit-progress').value,
    };

    console.log(formData);
    fetch('../api/edit_data.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData)
    })
        .then(res => res.json())
        .then(result => {
            if (result.success) {
                alert(result.message);
                tutupModalEdit();
                loadDashboardData();
            } else {
                alert('Gagal mengedit data: ' + result.message);
            }
        })
        .catch(err => {
            console.error('Gagal edit data:', err);
            alert('Terjadi kesalahan saat mengedit data.');
        });
});


// fungsi untuk filter pencarian data
// Terapkan Pencarian
function applyFilters() {
    currentFilters.search = document.getElementById('searchInput').value.trim();
    currentFilters.kabupaten = document.getElementById('kabupatenFilter').value;
    currentFilters.tahun = document.getElementById('tahunFilter').value;

    // Load ulang hanya ketika tombol ditekan
    loadDashboardData();
}

// Reset Filter
function resetFilters() {
    document.getElementById('searchInput').value = '';
    document.getElementById('kabupatenFilter').value = '';
    document.getElementById('tahunFilter').value = '';

    currentFilters = { search: '', kabupaten: '', tahun: '' };
    loadDashboardData();
}

document.getElementById('searchInput').addEventListener('keyup', function () {
    applyFilters();
});

// Statistic Card

function updateStats(data) {
    // Hitung jumlah total kegiatan
    const totalTasks = data.length;

    // Hitung ongoing dan completed
    const ongoingTasks = data.filter(item => Number(item.progress) > 0 && Number(item.progress) < 100).length;
    const completedTasks = data.filter(item => Number(item.progress) === 100).length;

    // Hitung rata-rata progress
    const avgProgress = totalTasks > 0
        ? (data.reduce((sum, item) => sum + Number(item.progress || 0), 0) / totalTasks).toFixed(1)
        : 0;

    // Update elemen DOM
    document.getElementById('totalTasks').textContent = totalTasks;
    document.getElementById('ongoingTasks').textContent = ongoingTasks;
    document.getElementById('completedTasks').textContent = completedTasks;
    document.getElementById('avgProgress').textContent = `${avgProgress}%`;
}
