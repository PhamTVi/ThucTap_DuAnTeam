const ThemNguoiDung = () => {
    $('#themnguoiDung').modal('show');
    $('#truongHop').text('THÊM NGƯỜI DÙNG');
    LoadTatCaDuAn('#LoadTatCaDuAn');
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
const LoadTatCaDuAn = (idCbb) => {
    var url = '../QuanLyNguoiDung/hienThiTatCaDuAn';
    var params = '';
    JsonResult(url, params, onSuccessCallBack, onErrorCallBack);
    function onSuccessCallBack(values) {

        if (values.status) {
            console.log(values.dataList);
            var str = '';
            $.each(values.dataList, (index, item) => {
                str += '<tr>';
                str += `<td>${index + 1}</td>`;
                str += `<td>${item.TenDuAn}</td>`;
                str += `<td><input type="checkbox" /></td>`;
                str += `<td><input type="checkbox" /></td>`;
                str += `<td><input type="checkbox" /></td>`;
                str += '</tr>';
            });
            $(`${idCbb}`).html(str);

        }
    }
    function onErrorCallBack(err) {
        console.log(err);
    }
}
const LoadTatCaBoPhan = (idCbb) => {
    var url = '../QuanLyNguoiDung/hienThiBoPhan';
    var params = '';
    JsonResult(url, params, onSuccessCallBack, onErrorCallBack);
    function onSuccessCallBack(values) {

        if (values.status) {
            console.log(values.dataList);
            var str = '';
            $.each(values.dataList, (index, item) => {
                str += `<td> <input type="checkbox" /></td>`;
            });
            $(`${idCbb}`).html(str);

        }
    }
    function onErrorCallBack(err) {
        console.log(err);
    }
}
const themNguoiDung = () => {
    const sp = {};
    sp.HoDemND = $('#hoTenDem').val()
    sp.TenND = $('#tenND').val();
    sp.TenDangNhap = $('#tenDangNhap').val();
    sp.MatKhau = $('#MatKhau').val();
    $('#truongHop').text('THÊM NGƯỜI DÙNG');
    $.ajax({
        url: '../QuanLyNguoiDung/ThemNguoiDung',
        type: 'POST',
        dataType: 'JSON',
        data: sp,
        success: (res) => {
            if (res.status) {
                Swal.fire({
                    icon: 'success',
                    title: 'Thêm người dùng thành công',
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