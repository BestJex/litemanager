<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>菜单添加--layui后台管理模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <link href="${basePath!}/static/colorpicker/css/jquery-ui.min.css" rel="stylesheet" type="text/css">
    <link href="${basePath!}/static/colorpicker/css/evol-colorpicker.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script src="${basePath!}/static/colorpicker/js/jquery.min.js"></script>
    <script src="${basePath!}/static/colorpicker/js/jquery-ui.min.js"></script>
    <script src="${basePath!}/static/colorpicker/js/evol-colorpicker.js"></script>

    <style type="text/css">
        .layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
        @media(max-width:1240px){
            .layui-form-item .layui-inline{ width:100%; float:none; }
        }
        .layui-form-item .role-box {
            position: relative;
        }
        .layui-form-item .role-box .jq-role-inline {
            height: 100%;
            overflow: auto;
        }
        .colorPicker {
            display: inline-block;
            height:38px;
            margin-bottom: 8px;
            margin-right: 3px;
            line-height: 1.3;
            border-width: 1px;
            border-style: solid;
            border-color: #e6e6e6;
            background-color: #fff;
            border-radius: 2px;
        }

        .evo-pointer {
            margin-top: 7px;
            width: 23px;
            height: 23px;
        }

    </style>
</head>


<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <#if parentMenu != null>
    <div class="layui-form-item">
        <label class="layui-form-label">父菜单名称</label>
        <div class="layui-input-block">
            <select name="parentId" class="layui-input" disabled="">
                <option value="${parentMenu.id}">${parentMenu.name}</option>
            </select>
        </div>
    </div>
    </#if>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单名称</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="name" lay-verify="required" placeholder="请输入菜单名称">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单背景色</label>
        <div class="layui-input-block">
            <input style="width:80px;" id="bgColor" name="bgColor" class="colorPicker evo-cp0" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单地址</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="href"  placeholder="请输入菜单地址">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单权限</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="permission"  placeholder="菜单权限">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单图标</label>
        <div class="layui-input-block">
            <input type="hidden" class="layui-input" name="icon" id="iconValue"  placeholder="请选择菜单图标">
            <div class="layui-input-inline" style="width: 100px;">
                <i class="layui-icon" id="realIcon" style="display: none;font-size: 50px"></i>
            </div>
            <div class="layui-input-inline" style="width: 100px;">
                <a class="layui-btn layui-btn-normal" id="selectIcon">选择一个图标</a>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">左侧菜单栏是否显示</label>
        <div class="layui-input-block">
            <input type="checkbox" name="isShow" lay-skin="switch"    lay-text="是|否" checked>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addUser">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>
    var iconShow,$;

    layui.use(['form','jquery','layer'],function(){
       var form = layui.form,
           layer = layui.layer;
           $ = layui.jquery;

        $(document).ready(function() {
            $("#bgColor").colorpicker({
                color: "#1bbcc2",
                defaultPalette: 'web'
            });
        });

        $("#bgColor").on("change.color", function(event, color){
            $("input[name='bgColor']").val(color);
        });

        //选择图标
        $("#selectIcon").on("click",function () {
            iconShow =layer.open({
                type: 2,
                title: '选择图标',
                shadeClose: true,
                content: '${basePath!}/static/page/icon.html'
            });
            layer.full(iconShow);
        });

        form.on("submit(addUser)",function(data){
            //判断左侧是否显示
            if(undefined !== data.field.isShow && null != data.field.isShow){
                data.field.isShow = true;
            }else{
                data.field.isShow = false;
            }
            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.post("${basePath!}/admin/system/menu/add",data.field,function (res) {
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("菜单添加成功!",{time:1500},function(){
                        //刷新父页面
                        parent.location.reload();
                    });
                }else{
                    layer.msg(res.message);
                }
            });
            return false;
        });

    });
</script>
</body>
</html>