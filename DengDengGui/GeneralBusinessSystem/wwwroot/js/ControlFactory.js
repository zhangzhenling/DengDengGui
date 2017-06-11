﻿/*************************************
 * 控件创建器
 ************************************/

//日期时间创造器
function CreateDateTime(field) {
    var dateTimeHtml = '\
     <div class="form-group">\
         <div class="input-group date form_datetime" data-date="" data-date-format="yyyy-MM-dd HH:ii:00" data-link-field="dtp_input1">\
              <input id="satrt_rq" class="form-control" size="19" type="text" value="" readonly>\
              <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
         </div>\
         <input type="hidden" id="dtp_input1" value="" />\
     </div>';
    return dateTimeHtml;
}

//日期创造器
function CreateDate() {
    var dateHtml = '\
    <div class="form-group">\
        <div  class="input-group date form_date" data-data="" data-link-format="yyyy-mm-dd" data-date-format="yyyy MM dd" data-link-field="dtp_input2">\
            <input id="end_rq" class="form-control" size="16" type="text" value="" readonly>\
                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
                </div>\
            <input type="hidden" id="dtp_input2" value="" />\
        </div>';
    return dateHtml;
}

//文本创造器
function CreateText() {
}

//单选框创造器
function CreateRadio() {
}

//复选框创造器
function CreateCheckbox() {
}

//下拉列表创造器
function CreateSelect() {
}

//自动下拉创造器
function CreateAutoComplete() {
}

//弹框列表创造器
function CreateListDialog() {
}