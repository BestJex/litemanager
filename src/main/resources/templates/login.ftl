<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>登录-后台管理系统</title>
    <!-- 页面描述 -->
    <meta name="description" content="${site.description}"/>
    <!-- 网页作者 -->
    <meta name="author" content="${site.author}"/>
    <link rel="icon" href="${site.logo}">
    <link href="${basePath!}/static/layui/css/layui.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/static/css/login/font-awesome.css" rel="stylesheet">
    <link href="${basePath!}/static/css/login/login.css" rel="stylesheet">
    <link href="${basePath!}/static/css/login/normalize.css" rel="stylesheet">
    <link href="${basePath!}/static/css/login/demo.css" rel="stylesheet">
    <link href="${basePath!}/static/css/login/component.css" rel="stylesheet">
<style>
.body{
    overflow: hidden;
}
canvas {
    position: absolute;
}

.kit-login-box header h1 {
    line-height: normal;
}

.kit-login-box header {
    height: auto;
}
.content {
    padding-top: 150px;
    position: relative;
}
.codrops-demos {
    position: absolute;
    bottom: 0;
    left: 40%;
    z-index: 10;
}

.codrops-demos a {
    border: 2px solid rgba(242, 242, 242, 0.41);
    color: rgba(255, 255, 255, 0.51);
}

.kit-pull-right button,
.kit-login-main .layui-form-item input {
    background-color: transparent;
    color: white;
}

.kit-login-main .layui-form-item input::-webkit-input-placeholder {
    color: white;
}

.kit-login-main .layui-form-item input:-moz-placeholder {
    color: white;
}

.kit-login-main .layui-form-item input::-moz-placeholder {
    color: white;
}

.kit-login-main .layui-form-item input:-ms-input-placeholder {
    color: white;
}

.kit-pull-right button:hover {
    border-color: #009688;
    color: #009688
}
#bg-body{
    position: absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
}
#bg-body img{
    width:100%;
    height:100%;
}
</style>
</head>
<body class="body">
<div id="bg-body" style=""></div>
<div id="large-header" style="position: absolute;">
    <canvas id="demo-canvas"></canvas>
</div>
<div class="content">
    <div class="kit-login-box">
        <header>
            <h1>后台管理系统</h1>
        </header>
        <div class="kit-login-main">
            <form class="layui-form" action="${basePath!}/login/main" method="post">
                <div class="layui-form-item">
                    <label class="kit-login-icon">
                        <i class="layui-icon"></i>
                    </label>
                    <input type="text" id="username" name="username" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="kit-login-icon">
                        <i class="layui-icon"></i>
                    </label>
                    <input type="password" id="password" name="password" lay-verify="required" autocomplete="off" placeholder="请输入密码" class="layui-input">
                </div>
                <div class="layui-form-item input-item"  id="imgCode">
                    <label class="kit-login-icon">
                        <i class="layui-icon"></i>
                    </label>
                    <input type="text" placeholder="请输入验证码" id="code" name="code"  autocomplete="off" id="code" class="layui-input">
                <#--验证码通过接口获取-->
                    <span class="form-code" id="changeCode" style="position:absolute;right:2px; top:2px;">
                                       <img id="mycode" title="看不清，换一张" src="${basePath!}/genCaptcha"/>
                                    </span>
                </div>
                <div class="layui-form-item">
                    <div class="kit-pull-left kit-login-remember">
                        <input type="checkbox" name="rememberMe" value="true" lay-skin="primary" checked="" title="记住帐号?"><div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><span>记住帐号?</span><i class="layui-icon"></i></div>
                    </div>
                    <div class="kit-pull-right">
                        <button class="layui-btn layui-btn-primary" lay-filter="login" lay-submit>
                            <i class="fa fa-sign-in" aria-hidden="true"></i> 登录
                        </button>
                    </div>
                    <div class="kit-clear"></div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${basePath!}/static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
<script src="${basePath!}/static/js/login/TweenLite.min.js"></script>
<script src="${basePath!}/static/js/login/EasePack.min.js"></script>
<script src="${basePath!}/static/js/login/rAF.js"></script>
<script src="${basePath!}/static/js/login/demo-1.js"></script>
<script type="text/javascript" src="${basePath!}/static/js/jquery.bcat.bgswitcher.js"></script>
<script>

$(document).ready(function() {
    var srcBgArray = [
        "${basePath!}/static/images/loginBg2.jpg",
        "${basePath!}/static/images/loginBg1.jpg",
        "${basePath!}/static/images/loginBg3.jpg",
        "${basePath!}/static/images/loginBg4.jpg"
    ];
    $('#bg-body').bcatBGSwitcher({
        timeout:5000,
        urls: srcBgArray,
        alt: 'Full screen background image'
    });
});

layui.use(['layer', 'form'], function() {
    var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;

    $("#mycode").on('click',function(){
        var t = Math.random();
        $("#mycode")[0].src="${basePath!}/genCaptcha?t= "+t;
    });

    form.on('submit(login)', function(data) {
        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        if($('form').find('input[type="checkbox"]')[0].checked){
            data.field.rememberMe = true;
        }else{
            data.field.rememberMe = false;
        }
        $.post(data.form.action, data.field, function(res) {
            layer.close(loadIndex);
            if(res.success){
                location.href="${basePath!}/"+res.data.url;
            }else{
                layer.msg(res.message);
                $("#mycode").click();
            }
        });
        return false;
    });
});
</script>
</body>
</html>
