<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>系统基本信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style type="text/css">
        .layui-form-item .layui-inline{ min-width:15%; float:left; margin-right:0; }
        .layui-form-item .role-box {
            position: relative;
        }

    </style>
</head>
<body class="childrenBody">

<form class="layui-form">
    <input type="hidden" name="id" value="${site.id}">
    <table class="layui-table">
        <colgroup>
            <col width="20%">
            <col width="50%">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>参数说明</th>
            <th>参数值</th>
            <th>变量名</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>系统名称</td>
            <td><input type="text" class="layui-input cmsName" name="name" value="${site.name}" lay-verify="required" placeholder="请输入网站名称"></td>
            <td>name</td>
        </tr>
        <tr>
            <td>系统LOGO</td>
            <td>
                <div class="layui-upload">
                    <input type="hidden" name="logo" id="logo" value="${site.logo}" >
                    <button type="button" class="layui-btn layui-btn-normal" id="test1"><i class="layui-icon"></i>上传LOGO</button>
                    <div class="layui-upload-list" style="width: 50%;float: right;">
                        <img class="layui-upload-img" id="demo1" <#if (site.logo)??> src="${site.logo}"</#if>>
                        <p id="demoText"></p>
                    </div>
                </div>
            </td>
            <td>logo</td>
        </tr>
        <tr>
            <td>系统网址</td>
            <td><input type="text" class="layui-input cmsName" name="url" value="${site.url}" lay-verify="required" placeholder="请输入网站地址"></td>
            <td>url</td>
        </tr>
        <tr>
            <td>当前版本</td>
            <td><input type="text" class="layui-input version" name="version" value="${site.version}" placeholder="请输入当前版本"></td>
            <td>version</td>
        </tr>
        <tr>
            <td>开发者</td>
            <td><input type="text" class="layui-input author" name="author" value="${site.author}" placeholder="请输入开发者"></td>
            <td>author</td>
        </tr>
        <tr>
            <td>文件上传方式</td>
            <td>
                <input type="radio" name="fileUploadType" value="local" title="本地上传" <#if (site.fileUploadType == "local") >checked=""</#if>   >
                <input type="radio" name="fileUploadType" value="qiniu" title="七牛云存储" lay-filter="qiniuUpload" <#if (site.fileUploadType == "qiniu") >checked=""</#if>>
                <input type="radio" name="fileUploadType" value="oss" title="阿里云存储" lay-filter="ossUpload" <#if (site.fileUploadType == "oss") >checked=""</#if>>
            </td>
            <td>fileUploadType</td>
        </tr>
        <tr>
            <td>服务器环境</td>
            <td><input type="text" class="layui-input server layui-disabled" name="server" disabled value="${site.server}" placeholder="请输入服务器环境"></td>
            <td>server</td>
        </tr>
        <tr>
            <td>数据库版本</td>
            <td><input type="text" class="layui-input dataBase layui-disabled" name="database" disabled value="${site.database}" placeholder="请输入数据库版本"></td>
            <td>database</td>
        </tr>
        <tr>
            <td>最大上传限制</td>
            <td><input type="number" class="layui-input maxUpload" name="maxUpload" lay-verify="number" value="${site.maxUpload}" placeholder="请输入最大上传限制"></td>
            <td>maxUpload</td>
        </tr>
        <tr>
            <td>系统描述</td>
            <td><textarea placeholder="请输入网站描述" name="description"  class="layui-textarea description">${site.description}</textarea></td>
            <td>description</td>
        </tr>
     <#--   <tr>
            <td>个人简介</td>
            <td><div id="content">${site.remarks}</div></td>
            <td>remarks</td>
        </tr>-->
        </tbody>
    </table>
    <div class="layui-form-item" style="text-align: right;">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="site">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
<script type="text/javascript" src="${basePath!}/static/js/wangEditor.min.js"></script>
<script>
    layui.use(['form','layer','jquery','upload'], function(){
            var form = layui.form,
                layer = layui.layer,
                upload=layui.upload,
                // E = window.wangEditor,
                $ = layui.jquery;

        <#--var content_editor = new E('#content');-->
        <#--//图片上传-->
        <#--content_editor.customConfig.uploadImgServer = '${basePath!}/file/uploadWang';-->
        <#--content_editor.customConfig.uploadFileName = 'test';-->
        <#--// 自定义处理粘贴的文本内容(这里处理图片抓取)-->
        <#--content_editor.customConfig.pasteTextHandle = function (content) {-->
            <#--if(undefined === content){-->
                <#--return content;-->
            <#--}-->
            <#--if(content.indexOf("src=")<=0){-->
                <#--return content;-->
            <#--}-->
            <#--var loadContent = layer.load(2, {-->
                <#--shade: [0.3, '#333']-->
            <#--});-->
            <#--$.ajax({-->
                <#--url: "${basePath!}/file/doContent/",-->
                <#--type: "POST",-->
                <#--async: false,-->
                <#--data:{"content":content},-->
                <#--dataType: "json",-->
                <#--success:function(res){-->
                    <#--layer.close(loadContent);-->
                    <#--content = res.data;-->
                <#--}-->
            <#--});-->
            <#--return content;-->
        <#--};-->
        <#--// 关闭粘贴样式的过滤-->
        <#--content_editor.customConfig.pasteFilterStyle = false;-->
        <#--content_editor.customConfig.customAlert = function (info) {-->
            <#--// info 是需要提示的内容-->
            <#--layer.msg(info);-->
        <#--};-->
        <#--content_editor.create();-->

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1',
            url: '${basePath!}/file/upload',
            accept:'images',
            exts:'ico',
            field:'test',
            before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            },
            done: function(res){
                //如果上传失败
                if(res.success === false){
                    return layer.msg('上传失败');
                }
                $("#logo").val(res.data.url);
            },
            error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

        form.on('radio(qiniuUpload)', function(data){
            layer.open({
                title : "七牛云信息",
                type : 2,
                content : "${basePath!}/admin/system/site/qiniu",
                area: ['600px','550px'],
                cancel:function (index, layero) {
                    console.log(layero);
                }
            });
        });

        form.on('radio(ossUpload)', function(data){
            layer.open({
                title : "阿里云信息",
                type : 2,
                content : "${basePath!}/admin/system/site/oss",
                area: ['600px','600px']
            });
        });

        form.on('submit(site)',function(data){
           /* var c = content_editor.txt.html();
            if(null != c || "" !== c || undefined !== c){
                c = c.replace(/\"/g, "'");
                data.field.remarks = c;
            }*/

            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.post('${basePath!}/admin/system/site/edit',data.field,function (res) {
                layer.close(loadIndex);
               if(res.success){
                   layer.msg("系统信息更新成功",function () {
                       location.reload();
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