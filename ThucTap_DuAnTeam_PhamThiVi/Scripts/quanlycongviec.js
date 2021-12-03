const loadTuanLamViec = (idCbb) => {
    var id = $('#maThang').val();
    $.ajax({
        url: `../Home/LoadTuanCongViec/${id}`,
        type: 'GET',
        dataType: 'JSON',
        contentType: 'application/json; charset-utf-8',
        success: (data) => {
            $(`${idCbb}`).empty();
            if (data.status) {
                var str = "";
                $.each(data.dataList, (i, item) => {
                    console.log(data);
                    str += `<option value = "${item.idTuan}"> ${item.TenTuan} &ensp;  ${item.NgayBDau} -> ${item.NgayKThuc}</option>`;
                });
                $(`${idCbb}`).append(str);
            }
        },
        error: (err) => {
            console.log(err);
        }

    });
}
const loadTuanLamViec2 = (idCbb) => {
    var id = $('#loadThang').val();
    $.ajax({
        url: `../Home/LoadTuanCongViec/${id}`,
        type: 'GET',
        dataType: 'JSON',
        contentType: 'application/json; charset-utf-8',
        success: (data) => {
            $(`${idCbb}`).empty();
            if (data.status) {
                var str = "";
                $.each(data.dataList, (i, item) => {
                    console.log(data);
                    str += `<option value = "${item.idTuan}"> ${item.TenTuan} &ensp;  ${item.NgayBDau} -> ${item.NgayKThuc}</option>`;
                });
                $(`${idCbb}`).append(str);
            }
        },
        error: (err) => {
            console.log(err);
        }

    });
}
const ThemCongViec = () => {
    $('#themconviec').modal('show');
    $('#truongHop').text('THÊM CÔNG VIỆC TUẦN');
    loadNguoiDung('#loadNguoiDung');
    loadThangLamViec('#loadThang');
    loadModule('#LoadModule')
}
const loadModule = (idCbb) => {
    var url = '../QuanLyCongViec/hienThiModule';
    var params = '';
    JsonResult(url, params, onSuccessCallBack, onErrorCallBack);
    function onSuccessCallBack(values) {

        if (values.status) {
            console.log(values.dataList);
            var options = '';
            $.each(values.dataList, (index, item) => {
                options += `<option value = "${item.idModule}"> ${item.TenModule} </option>`;
            });
            options += '</select>';
            $(`${idCbb}`).html(options);

        }
    }
    function onErrorCallBack(err) {
        console.log(err);
    }
}
const loadNguoiDung = (idCbb) => {
    var url = '../ToDoList/hienThiNguoiDung';
    var params = '';
    JsonResult(url, params, onSuccessCallBack, onErrorCallBack);
    function onSuccessCallBack(values) {

        if (values.status) {
            console.log(values.dataList);
            var options = '';
            $.each(values.dataList, (index, item) => {
                options += `<option value = "${item.idNguoiDung}"> ${item.HoDemND} ${item.TenND} </option>`;
            });
            $(`${idCbb}`).html(options);

        }
    }
    function onErrorCallBack(err) {
        console.log(err);
    }
}
const loadThangLamViec = (idCbb) => {
    var url = '../Home/hienThiALLThangLamViec';
    var params = '';
    JsonResult(url, params, onSuccessCallBack, onErrorCallBack);
    function onSuccessCallBack(values) {

        if (values.status) {
            console.log(values.dataList);
            var options = '';
            $.each(values.dataList, (index, item) => {
                options += `<option value = "${item.idThang}"> ${item.TenThang} </option>`;
            });
            options += '</select>';
            $(`${idCbb}`).html(options);

        }
    }
    function onErrorCallBack(err) {
        console.log(err);
    }
}
const JsonResult = (url, params, onSuccessCallBack, onErrorCallBack) => {
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'JSON',
        contentType: 'application/json; charset-utf-8',
        data: params,
        success: onSuccessCallBack,
        error: onErrorCallBack
    })
}

const themCongViecTuan = () => {
    const sp = {};
    sp.idTuan  = $('#LoadTuan').val();
    sp.GTThang = $('#loadThang').val();
    sp.MaModule = $('#LoadModule').val();
    sp.MaND = $('#loadNguoiDung').val();
    sp.TenIssue = $('#TenIssue').val();
    sp.UrlIssue = $('#UrlIssue').val();
    sp.TenCongViec = $('#TenCongVuec').val();
    sp.ThoiGianLam = $('#ThoiGianLam').val();
    sp.Nguon = $('#Nguon').val();
    sp.TrangThai = $('#TinhTrang').val();
    sp.NgayBD = $('#TuNgay').val();
    sp.NgayKT = $('#DenNgay').val();
    sp.GhiChu = $('#GhiChu').val();
    $('#truongHop').text('THÊM CÔNG VIỆC TUẦN');
    $.ajax({
        url: '../QuanLyCongViec/ThemCongViecTuan',
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
