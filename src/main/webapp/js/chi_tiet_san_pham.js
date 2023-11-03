var nutMoTa = document.querySelector('.nut-mo-ta');
var nutDanhGia = document.querySelector('.nut-danh-gia');
var tab1 = document.querySelector('.tab1');
var tab2 = document.querySelector('.tab2');
var thanhGachChanTab = document.querySelector('.thanh-gach-chan-tab')
var clickTab1 = 1;
var listPage = document.querySelectorAll('.so-trang');
var listPhanLoai = document.querySelectorAll('#nut-phan-loai');
var choTietTab = document.querySelector('.chi-tiet-tab');
nutMoTa.onclick = () => {
    if(clickTab1 === 1){

    }
    else{
        tab1.style.display = 'block';
        tab2.style.display = 'none';
        thanhGachChanTab.style.animation = 'quaTrai 0.5s 1 forwards';
        choTietTab.style.animation = 'keoDai1 1.5s 1 forwards';
        clickTab1 = 1;
    }
}
var tangSoLuong = document.querySelector('.cong');
var giamSoLuong = document.querySelector('.tru');
var index = 1;
var soLuong = document.querySelector('.so-luong');
tangSoLuong.onclick = () => {
    if(index<20) {
        index += 1;
        soLuong.innerHTML = index;
    }
}
giamSoLuong.onclick = () => {
    if(index>1){
        index-=1;
        soLuong.innerHTML = index;
    }
}
var phanLoai = 1;
var end = endAll;
var right = Math.min(end,5);
var left = 1;
var tien = document.querySelector('.tien');
var lui = document.querySelector('.lui');
var page = 1;
var vitri = 0;
nutDanhGia.onclick = () => {
    let idx;
    if (clickTab1 === 0) {

    } else {
        tab1.style.display = 'none';
        tab2.style.display = 'block';
        thanhGachChanTab.style.animation = 'quaPhai 0.5s 1 forwards';
        choTietTab.style.animation = 'keoDai2 1.5s 1 forwards';
        clickTab1 = 0;
        idx = 0;
        left = 1;
        if (star === -1) right = Math.min(endAll, 5);
        else right = Math.min(listEnd[star], 5);
        for (let j = left; j <= right; j++) {
            listPage[idx].innerText = j.toString();
            idx += 1;
        }
        if (idx < 5) {
            for (let j = idx; j < 5; j++) {
                listPage[j].style.display = 'none';
            }
        }
        vitri = 0;
    }
}
var frame = document.querySelector('.frame');
function animationPage(){
        frame.style.animation = 'rongDan 1.5s 1 ease';
}
document.querySelector('.frame').style.animation = 'rongDan 1.5 1 forwords';
listPhanLoai[0].style = 'border: 1px solid #00d0ea; background: rgba(0, 255, 255, 0.2);';
for(let i=0;i<listPhanLoai.length;i++){
    listPhanLoai[i].onclick = function (url){
        page = 1;
        vitri = 0;
        listPage[0].style.background = 'orange';
        listPhanLoai.forEach(value => {
            value.style = "background: #f6f6f6;color: #3D464D;";
        });
        listPhanLoai[i].style = 'border: 1px solid #00d0ea; background: rgba(0, 255, 255, 0.2);';
        if(i!==0){
            frame.contentWindow.location.replace('./danh-gia?id=' + id.toString() + '&page=1&star=' + (6-i).toString());
            star = 6-i;
            end = listEnd[star];
        }
        else{
            frame.contentWindow.location.replace('./danh-gia?id='+id.toString()+'&page=1');
            star = -1;
            end = endAll;
        }
        right = Math.min(end,5);
        for(let j=0;j<listPage.length;j++){
            listPage[j].style.background = '#e0e0e0';
            listPage[j].innerText = (j+1).toString();
            listPage[j].style.display = 'block';
        }
        listPage[0].style.background = 'orange';
        if(right<5){
            for(let j=right;j<5;j++){
                listPage[j].style.display = 'none';
            }
        }
        tien.disabled = false;
        lui.disabled = true;
    }
}
function setLink(i){
    listPage.forEach(
        value => {
            value.style.background = '#e0e0e0';
        }
    )
    page = listPage[i].innerText;
    console.log((page.toString()));
    frame.contentWindow.location.replace('./danh-gia?id=' + id.toString() + '&page=' + page + '&star=' + star.toString());
    let x = (parseInt((right - left + 1) / 2));
    let number = listPage[i].innerText;
    if(end>5){
        if(i>x && right!==end){
            right+=(i-x);
            right = Math.min(end,right);
            left = right-4;
            let idx = 0;
            for(let j=left;j<=right;j++){
                listPage[idx].innerText = j.toString();
                if(number===j.toString()){
                    listPage[idx].style.background = 'orange';
                    vitri = idx;
                }
                idx+=1;
            }
        }
        else if(i<x && left!==1){
            left-=(x-i);
            left = Math.max(1,left);
            right = left+4;
            let idx = 0;
            for(let j=left;j<=right;j++){
                listPage[idx].innerText = j.toString();
                if(number===j.toString()){
                    listPage[idx].style.background = 'orange';
                    vitri = idx;
                }
                idx+=1;
            }
        }
        else {
            listPage[i].style.background = 'orange';
            vitri = i;
        }
    }
    else{
        listPage[i].style.background = 'orange';
        vitri = i;
    }
    lui.disabled = page <= 1;
    tien.disabled = page >= end;
}
listPage[0].style = 'background: orange';
for(let i=0;i<5;i++){
    listPage[i].onclick = function () {
        setLink(i);
    }
}
tien.onclick = function (){
    // lui.disabled = false;
    if(vitri<4 && page<end)
    setLink(vitri+1);
}
lui.onclick = function (){
    // tien.disabled = false;
    if(vitri>0 && page>1)
    setLink(vitri-1);
}