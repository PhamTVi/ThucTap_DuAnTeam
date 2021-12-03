const ThemTienDo = () => {
    $('#themtiendo').modal('show');
    $('#truongHop').text('THÊM THÁNG LÀM VIỆC');
}

const hienThiThangLam = () => {
    var id = $('#MaThangLV').val();
    $.ajax({
        url: `../Home/hienThiThangLamViec/${id}`,
        type: 'GET',
        contentType: 'application/json; charset-utf-8',
        success: (data) => {
            if (data.idThang != "") {
                loadTuanCongViec('#LoadTuanLamVCTheoThang', data.idThang);
            }
            else {
                $(`#LoadTuanLamVCTheoThang`).empty();
            }
            console.log(data);
            $('#ThangLV').val(data.TenThang);
            $('#NamLV').val(data.NamLamViec);
            console.log(data.NgayBDLam2);
            $('#NgayBatDau').val(data.NgayBDLam2);
            $('#NgayKetThuc').val(data.NgayKTLam2);
            if (data.TenThang == "") {
                $('#ThangLV').prop('readonly', false);
                $('#NamLV').prop('readonly', false);
                $('#truongHop').text('THÊM THÁNG LÀM VIỆC');

            }
            else {
                $('#ThangLV').prop('readonly', true);
                $('#NamLV').prop('readonly', true);
                $('#MaThangLV').prop('readonly', false);
                $('#truongHop').text('XEM THÁNG LÀM VIỆC');
            }
        },
        error: (err) => {
            alert(err);
        },

    });
}
const loadTuanCongViec = (idCbb, id) => {
        $.ajax({
            url: `../Home/LoadTuanCongViec/${id}`,
            type: 'GET',
            dataType: 'JSON',
            contentType: 'application/json; charset-utf-8',
            success: (data) => {
                $(`${idCbb}`).empty();
                if (data.status) {
                    var str = "";
                    var ngayBDTiep = "";
                    var ngayKTTiep = "";
                        $.each(data.dataList, (i, item) => {
                            console.log(data);
                            str += "<tr>";
                            str += "<td>" + item.TenTuan + "</td>";
                            str += "<td>" + item.STTTuan + "</td>";
                            str += "<td>" + item.NgayBDau + "</td>";
                            str += "<td>" + item.NgayKThuc + "</td>";
                            str += "<td>" + item.SoGioLamViec + "</td>";
                            if (!item.TrangThai) {
                                str += "<td><input type='checkbox' checked /></td>";
                            }
                            else {
                                str += "<td><input type='checkbox' /></td>";
                            }
                            ngayBDTiep = item.NgayBD;
                            ngayKTTiep = item.NgayKT;
                            str += "/<tr>";
                        });
                    str += "<tr>";
                    str += "<td><input type='text' class='form-control' style='width: 100px' id='TenTuan' /></td>";
                    str += "<td><input type='number' class='form-control' min='0'  style='width: 70px' id='STTTuan' /></td>";
                    str += `<td><input type='date' class='form-control' value ='${ngayBDTiep}' style='width: 160px'  id='NgayBDau'/></td>`;
                    str += `<td><input type='date' class='form-control' value ='${ngayKTTiep}'  style='width: 160px' id='NgayKThuc' /></td>`;
                    str += "<td><input type='number' class='form-control'  min='0'  style='width: 80px' id='SoGioLamViec' /></td>";
                    str += "<td><input type='checkbox' /></td>";
                    str += "</tr >";
                    $(`${idCbb}`).append(str);
                }
            },
            error: (err) => {
                console.log(err);
            }

        });
}
const themThangLamViec = () => {
    const sp = {};
    sp.MaThangLV = $('#MaThangLV').val()
    sp.TenThang = $('#ThangLV').val();
    sp.NamLamViec = $('#NamLV').val();
    sp.NgayBDLam = $('#NgayBatDau').val();
    sp.NgayKTLam = $('#NgayKetThuc').val();
    $('#truongHop').text('THÊM THÁNG LÀM VIỆC');
    $.ajax({
        url: '../Home/ThemThangLamViec',
        type: 'POST',
        dataType: 'JSON',
        data: sp,
        success: (res) => {
            if (res.status) {
                Swal.fire({
                    icon: 'success',
                    title: 'Thêm tháng thành công',
                    showConfirmButton: false,
                    timer: 1500,

                });
            }
        },
        error: (err) => {
            console.log(err)
        }

    });
}
const hienThiChinhSuaThangLam = (id) => {
    $('#MaThangLV').val(id);
    $('#themtiendo').modal('show');
    $('#truongHop').text("SỬA THÁNG LÀM VIỆC");
    $.ajax({
        url: `../Home/hienThiThangLamViec/${id}`,
        type: 'GET',
        contentType: 'application/json; charset-utf-8',
        success: (data) => {
            if (data.idThang != "") {
                loadTuanCongViec('#LoadTuanLamVCTheoThang', data.idThang);
            }
            console.log(data);
            $('#ThangLV').val(data.TenThang);
            $('#NamLV').val(data.NamLamViec);
            console.log(data.NgayBDLam2);
            $('#NgayBatDau').val(data.NgayBDLam2);
            $('#NgayKetThuc').val(data.NgayKTLam2);
            var th = $('#truongHop').text();
            if (th == "SỬA THÁNG LÀM VIỆC") {
                $('#ThangLV').prop('readonly', false);
                $('#NamLV').prop('readonly', false);
                $('#MaThangLV').prop('readonly', true);
            }
        },
        error: (err) => {
            alert(err);
        },

    });
}
const suaThangLamViec = (id) => {
    const sp = {};
    sp.MaThangLV = $('#MaThangLV').val()
    sp.TenThang = $('#ThangLV').val();
    sp.NamLamViec = $('#NamLV').val();
    sp.NgayBDLam = $('#NgayBatDau').val();
    sp.NgayKTLam = $('#NgayKetThuc').val();
    $.ajax({
        url: '../Home/SuaThangLamViec',
        type: 'POST',
        dataType: 'JSON',
        data: sp,
        success: (res) => {
            if (res.status) {
                alert("SỬA THÀNH CÔNG RỒI");
                $('#themtiendo').modal('hide');
                $('#truongHop').text('THÊM THÁNG LÀM VIỆC');
                $('#idSanPham').val('');
                $('#MaThangLV').val('');
                $('#ThangLV').val('');
                $('#hinhAnh').val('');
                $('#NgayBatDau').val(Date.now);
                $('#NgayKetThuc').val(Date.now);

            }

        },
        error: (err) => {
            console.log(err)
        }
    });
}
const suaTuanLamViec = (idtuan, idThang) => {
    
    const sp = {};
    sp.MaTuanLV = idtuan,
        sp.MaThangLV = idThang,
        sp.TrangThai = "False";
    $.ajax({
        url: '../TienDoCongViec/SuaTuanLamViec',
        type: 'POST',
        dataType: 'JSON',
        data: sp,
        success: (res) => {
            if (res.status) {
                alert("KHÓA THÀNH CÔNG");
            }

        },
        error: (err) => {
            console.log(err)
        }
    });
}
const themTuanLamViec = () => {
    const sp = {};
    sp.giaTri = $('#MaThangLV').val();
    sp.TenTuan = $('#TenTuan').val()
    sp.STTTuan = $('#STTTuan').val();
    sp.NgayBDau = $('#NgayBDau').val();
    sp.NgayKThuc = $('#NgayKThuc').val();
    sp.SoGioLamViec = $('#SoGioLamViec').val();
    if (sp.TenTuan != "" || sp.STTTuan != "" || sp.NgayBDau != "" && sp.NgayKThuc != "" || sp.SoGioLamViec != "") {
        $.ajax({
            url: '../Home/ThemTuanLamViec',
            type: 'POST',
            dataType: 'JSON',
            data: sp,
            success: (res) => {
                if (res.status) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Thêm Tuần thành công',
                        showConfirmButton: false,
                        timer: 1500,

                    });
                }
            },
            error: (err) => {
                console.log(err)
            }

        });
    }
 
}
