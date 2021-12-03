$(document).ready(() => {
    loadALLTodoList();
})
const loadALLTodoList = () => {
    $.ajax({
        url: `../ToDoList/hienThiALLToDoList`,
        type: 'GET',
        dataType: 'JSON',
        contentType: 'application/json; charset-utf-8',
        success: (data) => {
            if (data.status) {
                var str = "";
                var giatri = 0;
                $('#loadTodolist').empty();
                $.each(data.dataList, (i, item) => {
                    console.log(item.ThoiHan2);
                    giatri++;
                    str += `<tr >
                    <td><input type="checkbox" /></td>
                    <td>${giatri}</td>
                    <td>${item.NoiDung}</td>    
                    <td>${item.TenND}</td>`;
                    if (item.ThoiHan2.Days < 0) {
                        str += `<td><p style="border: 1px solid red; border-radius: 30px; text-align:center;background: #f4bb89; color: red"> Trễ ${-item.ThoiHan2.Days} Ngày</p></td>`;
                    }
                    else if (item.ThoiHan2.Days > 0) {
                        str += `<td>
                        <p style="border: 1px solid #0033FF; border-radius: 30px; text-align:center;background: #f4bb89; color: #0033FF">
                        còn ${item.ThoiHan2.Days + 1} Ngày</p> </td>`;
                    }
                    else {
                        str += `<td>
                        <p style="border: 1px solid #006600; border-radius: 30px; text-align:center;background: #f4bb89; color: #006600">
                        Hôm nay</p> </td>`;
                    }
                    str += `<td>${item.NgayKThuc}</td>
                    <td>${item.NgayBDau}</td>
                    <td>${item.GhiChu}</td>`;
                    if (!item.TinhTrang) {
                        str += "<td><input type='checkbox' checked /></td>";
                    }
                    else {
                        str += "<td><input type='checkbox' /></td>";
                    }
                    str += "/<tr>";

                });
                $('#loadTodolist').append(str);
            }
        },
        error: (err) => {
            console.log(err);
        }

    });
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
const themToDolist = () => {
    $('#toDoList').modal();
    loadNguoiDung('#loadNguoiDung');
}
const ThemToDoList = () => {
    const sp = {};
    sp.NoiDung = $('#NoiDung').val()
    sp.MaND = $('#loadNguoiDung').val();
    sp.NgayGiao = $('#NgayGiao').val();
    sp.HanDen = $('#NgayDenHan').val();
    sp.ghiChu = $('#GhiChu').val();

    $('#truongHop').text('THÊM TO DO LIST');
    $.ajax({
        url: '../ToDoList/ThemToDoList',
        type: 'POST',
        dataType: 'JSON',
        data: sp,
        success: (res) => {
            if (res.status) {
                loadALLTodoList()
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

const timKiemToDoList = () => {
    var noiDung = $('#noiDung').val();
    var MaND = $('#idNguoiDung').val();
    console.log(noiDung);
    const sp = {};
    sp.noiDung = noiDung;
    sp.MaND = MaND;
    $.ajax({
        url: `../ToDoList/timKiemToDoList/`,
        type: 'Get',
        dataType: 'JSON',
        data: sp,
        contentType: 'application/json; charset-utf-8',
        success: (data) => {
            if (data.status) {
                var str = "";
                var giatri = 0;
                $('#loadTodolist').empty();
                $.each(data.dataList, (i, item) => {
                    console.log(item.ThoiHan2);
                    giatri++;
                    str += `<tr >
                    <td><input type="checkbox" /></td>
                    <td>${giatri}</td>
                    <td>${item.NoiDung}</td>    
                    <td>${item.TenND}</td>`;
                    if (item.ThoiHan2.Days < 0) {
                        str += `<td><p style="border: 1px solid red; border-radius: 30px; text-align:center;background: #f4bb89; color: red"> Trễ ${-item.ThoiHan2.Days} Ngày</p></td>`;
                    }
                    else if (item.ThoiHan2.Days > 0) {
                        str += `<td>
                        <p style="border: 1px solid #0033FF; border-radius: 30px; text-align:center;background: #f4bb89; color: #0033FF">
                        còn ${item.ThoiHan2.Days + 1} Ngày</p> </td>`;
                    }
                    else {
                        str += `<td>
                        <p style="border: 1px solid #006600; border-radius: 30px; text-align:center;background: #f4bb89; color: #006600">
                        Hôm nay</p> </td>`;
                    }
                    str += `<td>${item.NgayKThuc}</td>
                    <td>${item.NgayBDau}</td>
                    <td>${item.GhiChu}</td>`;
                    if (!item.TinhTrang) {
                        str += "<td><input type='checkbox' checked /></td>";
                    }
                    else {
                        str += "<td><input type='checkbox' /></td>";
                    }
                    str += "/<tr>";

                });
                $('#loadTodolist').append(str);
            }
        },
        error: (err) => {
            console.log(err);
        }

    });
}