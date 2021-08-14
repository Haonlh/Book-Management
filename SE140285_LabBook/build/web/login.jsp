
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src='https://www.google.com/recaptcha/api.js'></script>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <style>
            .login-block{
                background: #DE6262;  /* fallback for old browsers */
                background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);  /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to bottom, #FFB88C, #DE6262); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                float:left;
                width:100%;
                padding : 50px 0;
            }
            .banner-sec{background:url(https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2019-mercedes-amg-gt53-4-door-103-1565872754.jpg?crop=0.638xw:0.586xh;0.204xw,0.327xh&resize=2048😘)  no-repeat left bottom; background-size:cover; min-height:500px; border-radius: 0 10px 10px 0; padding:0;}
            .container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);}
            .carousel-inner{border-radius:0 10px 10px 0;}
            .carousel-caption{text-align:left; left:5%;}
            .login-sec{padding: 50px 30px; position:relative;}
            .login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
            .login-sec .copy-text i{color:#FEB58A;}
            .login-sec .copy-text a{color:#E36262;}
            .login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #DE6262;}
            .login-sec h2:after{content:" "; width:100px; height:5px; background:#FEB58A; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
            .btn-login{background: #DE6262; color:#fff; font-weight:600;}
            .banner-text{width:70%; position:absolute; bottom:40px; padding-left:20px;}
            .banner-text h2{color:#fff; font-weight:600;}
            .banner-text h2:after{content:" "; width:100px; height:5px; background:#FFF; display:block; margin-top:20px; border-radius:3px;}
            .banner-text p{color:#fff;}
        </style>

        <title>Login Page</title>
    </head>
    <body>
        <section class="login-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 login-sec">
                        <h2 class="text-center">Login Now</h2>
                        <form action ="MainController" method ="POST">
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="text-uppercase">UserID</label>
                                    <input type="text" class="form-control" placeholder="" name="userID" value="">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="text-uppercase">Password</label>
                                <input type="password" class="form-control" placeholder="" name="password" value="">
                            </div>
                            
                            <button type="submit" class="btn btn-login float-left" name="action" value="Login">Login</button>
                            <button type="submit" class="btn btn-login float-right" name ="action" value="Create Accout">Create Account</button>

                        </form>
                        
                    </div>
                   
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
    </body>
</html>
